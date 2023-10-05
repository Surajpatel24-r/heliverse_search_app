import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../data/models/userDataModel.dart';
import '../controller.dart';
import '../widgets/card.dart';

class TeamDetailScreen extends StatelessWidget {
  final List<UserDataModel> selectedTeamMembers;
  TeamDetailScreen({super.key, required this.selectedTeamMembers});

  final HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Team Members"),
      ),
      body: selectedTeamMembers.isEmpty
          ? Center(
              child: Text(
                "Teams not exist",
                style: TextStyle(fontSize: 17.sp),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.all(12.0),
              itemCount: selectedTeamMembers.length,
              itemBuilder: (context, index) {
                final userData = selectedTeamMembers[index];
                return CardWidget(
                  id: userData.id,
                  firstName: userData.firstName!,
                  lastName: userData.lastName!,
                  email: userData.email!,
                  gender: userData.gender!,
                  image: userData.avatar!,
                  domain: userData.domain!,
                  availablity: userData.available!,
                  onPressedDelete: () {
                    _controller.deleteToTeam(userData);
                  },
                  isTeamDetailScreen: true,
                );
              },
            ),
    );
  }
}
