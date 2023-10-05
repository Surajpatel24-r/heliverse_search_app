import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:heliverse_search_app/app/modules/home/view/teamDetails.dart';
import '../../data/models/userDataModel.dart';

class HomeController extends GetxController {
  final scrollController = ScrollController();
  final top10ListedData = <UserDataModel>[].obs;
  final overAllData = <UserDataModel>[].obs;
  RxInt page = 1.obs;
  RxBool isLoadingMore = false.obs;
  RxBool showProgressIndicator = false.obs;
  RxBool dataNotExist = false.obs;
  final itemsPerPage = 10;

  final TextEditingController searchController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(scrollListener);
    fetchPosts();
  }

  Future<void> fetchPosts() async {
    if (isLoadingMore.value) return;

    isLoadingMore.value = true;
    showProgressIndicator.value = true;

    final jsonString =
        await rootBundle.loadString('assets/json/heliverse_mock_data.json');
    final jsonData = json.decode(jsonString) as List<dynamic>;

    final allUserData =
        jsonData.map((jsonItem) => UserDataModel.fromJson(jsonItem)).toList();
    overAllData.assignAll(allUserData);

    // Calculate the range of items to load
    final startIndex = top10ListedData.length;
    final endIndex = startIndex + itemsPerPage;

    if (startIndex < jsonData.length) {
      final paginatedData = jsonData.sublist(startIndex, endIndex);
      final userData = paginatedData
          .map((jsonItem) => UserDataModel.fromJson(jsonItem))
          .toList();

      top10ListedData.addAll(userData);

      // Delay for 2 seconds
      await Future.delayed(Duration(seconds: 2));

      isLoadingMore.value = false;
      showProgressIndicator.value = false;
      // Update the filtered data as well
      filterSearch(searchController.text);

      // Debugging: Print the length of allData after adding data
      print("allData loaded. Total items: ${top10ListedData.length}");
      print("filteredData loaded. Total items: ${filteredData.length}");
    } else {
      isLoadingMore.value = false;
      showProgressIndicator.value = false;

      print("No more data to load");
    }

    // Apply filters after loading data
    // applyFilters();
  }

  void scrollListener() {
    if (isLoadingMore.value || showProgressIndicator.value) return;

    if (scrollController.position.pixels >=
        scrollController.position.maxScrollExtent - 200) {
      fetchPosts();
    }
  }

  // =================== Filter Data by name ============================= //
  var filteredData = <UserDataModel>[].obs;

  // Filter data by name
  void filterSearch(String query) {
    if (query.isEmpty) {
      // If the query is empty, show all data
      filteredData.assignAll(top10ListedData);
    } else {
      // If the query is not empty, filter data based on the query
      final lowercaseQuery = query.toLowerCase();
      final filteredList = overAllData.where((user) {
        final firstName = user.firstName?.toLowerCase() ?? '';
        final lastName = user.lastName?.toLowerCase() ?? '';
        // Add more fields as needed for filtering

        return firstName.contains(lowercaseQuery) ||
            lastName.contains(lowercaseQuery);
      }).toList();

      if (filteredList.isEmpty) {
        dataNotExist.value = true;
      } else {
        dataNotExist.value = false;
      }

      filteredData.assignAll(filteredList);
    }
  }

  // ====================== Filter data from gender, availability and domain ========================== //

  // Availibility
  RxBool isSelectedAvailable = false.obs;
  RxBool isSelectedNotAvailable = false.obs;

  void selectAvailable() {
    isSelectedAvailable.value = !isSelectedAvailable.value;
    isSelectedNotAvailable.value = false;
  }

  void selectNotAvailable() {
    isSelectedAvailable.value = false;
    isSelectedNotAvailable.value = !isSelectedNotAvailable.value;
  }

  // Gender
  final Map<String, RxBool> genderSelections = {
    'Agender': false.obs,
    'Bigender': false.obs,
    'Genderfluid': false.obs,
    'Female': false.obs,
    'Male': false.obs,
    'Genderqueer': false.obs,
    'Non-binary': false.obs,
    'Polygender': false.obs,
  };

  void toggleGenderSelection(String key) {
    genderSelections[key]!.value = !genderSelections[key]!.value;
  }

  // Domains
  final Map<String, RxBool> domainSelections = {
    'Business Development': false.obs,
    'Finance': false.obs,
    'IT': false.obs,
    'Management': false.obs,
    'Marketing': false.obs,
    'Sales': false.obs,
    'UI Designing': false.obs,
  };

  void toggleDomainSelection(String key) {
    domainSelections[key]!.value = !domainSelections[key]!.value;
  }

  void applyFilters() {
    // Gender
    final selectedGenderTexts = genderSelections.entries
        .where((entry) => entry.value.value)
        .map((entry) => entry.key)
        .toList();

    // Domain
    final selectedDomainTexts = domainSelections.entries
        .where((entry) => entry.value.value)
        .map((entry) => entry.key)
        .toList();

    final filteredList = overAllData.where((user) {
      final genderFilter = selectedGenderTexts.isEmpty ||
          selectedGenderTexts.contains(user.gender);

      final domainFilter = selectedDomainTexts.isEmpty ||
          selectedDomainTexts.contains(user.domain);

      // final availabilityFilter = !isSelectedNotAvailable.value ||
      //     isSelectedNotAvailable.value == user.available;
      final availabilityFilter = isSelectedNotAvailable.value != user.available;

      return genderFilter && domainFilter && availabilityFilter;
    }).toList();

    if (filteredList.isEmpty) {
      dataNotExist.value = true;
    } else {
      dataNotExist.value = false;
    }

    filteredData.assignAll(filteredList);
  }

  // ============================= Add to Team ==================================== //
  List<UserDataModel> selectedTeamMembers = <UserDataModel>[];

  void addToTeam(UserDataModel userData) {
    final isAlreadyAdded =
        selectedTeamMembers.any((member) => member.id == userData.id);

    if (!isAlreadyAdded) {
      selectedTeamMembers.add(userData);
      Get.snackbar(
        "Added Successful",
        "${userData.firstName} ${userData.lastName} is already in the team.",
      );
    } else {
      // Show a message that it is already added
      Get.snackbar(
        "Already Added",
        "${userData.firstName} ${userData.lastName} is already in the team.",
      );
    }
  }

  void deleteToTeam(UserDataModel userData) {
    selectedTeamMembers.removeWhere((member) => member.id == userData.id);
    Get.back(result: selectedTeamMembers);
  }

  @override
  void onClose() {
    super.onClose();
    top10ListedData.close();
    filteredData.close();
    overAllData.close();
  }
}
