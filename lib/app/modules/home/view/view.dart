// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heliverse_search_app/app/modules/home/view/teamDetails.dart';
import 'package:heliverse_search_app/app/modules/home/widgets/card.dart';
import '../controller.dart';
import 'filterdatas.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        flexibleSpace: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 2.h),
            child: TextFormField(
              controller: _controller.searchController,
              onChanged: (value) {
                _controller.filterSearch(value);
              },
              decoration: InputDecoration(
                labelStyle: TextStyle(color: Colors.grey),
                focusColor: Colors.black,
                contentPadding: EdgeInsets.only(right: 40.w, left: 12.w),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                labelText: "Search Videos...",
                counterStyle: Theme.of(context).textTheme.bodyLarge,
                helperStyle: Theme.of(context).textTheme.bodyLarge,
                hintStyle: Theme.of(context).textTheme.bodyLarge,
                prefixIcon: Icon(Icons.search),
                suffixIcon: InkWell(
                    onTap: () {
                      Get.to(() => FilterDataScreen());
                    },
                    child: Icon(Icons.tune_outlined)),
              ),
            ),
          ),
        ),
      ),
      body: Obx(
        () => _controller.dataNotExist.value
            ? Center(
                child: Text(
                  "Data Not Exits",
                  style: TextStyle(fontSize: 17.sp),
                ),
              )
            : ListView.builder(
                padding: EdgeInsets.all(12.0),
                controller: _controller.scrollController,
                itemCount: _controller.isLoadingMore.value
                    ? _controller.filteredData.length + 1
                    : _controller.filteredData.length,
                // itemCount: _controller.isLoadingMore.value
                //     ? _controller.top10ListedData.length + 1
                //     : _controller.top10ListedData.length,
                itemBuilder: (context, index) {
                  if (index < _controller.filteredData.length) {
                    final userData = _controller.filteredData[index];
                    return CardWidget(
                      id: userData.id,
                      firstName: userData.firstName!,
                      lastName: userData.lastName!,
                      email: userData.email!,
                      gender: userData.gender!,
                      image: userData.avatar!,
                      domain: userData.domain!,
                      availablity: userData.available!,
                      onPressedAdd: () {
                        _controller.addToTeam(userData);
                      },
                      isTeamDetailScreen: false,
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.to(() => TeamDetailScreen(
                  selectedTeamMembers: _controller.selectedTeamMembers,
                ));
          },
          label: Text("Show Teams")),
    );
  }
}
