// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CardWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String? gender;
  final String? domain;
  bool availablity;
  final int? id;
  final String image;
  void Function()? onPressedAdd;
  void Function()? onPressedDelete;
  final bool isTeamDetailScreen;
  CardWidget(
      {super.key,
      this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.gender,
      required this.domain,
      required this.availablity,
      required this.image,
      this.onPressedAdd,
      this.onPressedDelete,
      required this.isTeamDetailScreen});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Text(
                    "id: $id",
                    style: TextStyle(fontSize: 10.sp),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.h),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: CircleAvatar(
                      radius: 26.r,
                      backgroundImage: NetworkImage(image),
                      backgroundColor: Colors.cyan[100],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$firstName $lastName",
                        style: TextStyle(fontSize: 17.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.8.h),
                        child: Text(
                          "$email",
                          style: TextStyle(fontSize: 13.sp),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 3.h),
                            child: Text(
                              "$gender",
                              style: TextStyle(fontSize: 13.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Container(
                              height: 12.h,
                              width: 1.5.w,
                              color: Colors.black54,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3.h),
                            child: Text(
                              "$domain",
                              style: TextStyle(fontSize: 13.sp),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Container(
                              height: 12.h,
                              width: 1.5.w,
                              color: Colors.black54,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 3.h),
                            child: Text(
                              "$availablity",
                              style: TextStyle(fontSize: 13.sp),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            isTeamDetailScreen
                ? Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Get.dialog(
                              AlertDialog(
                                title: Text("Delete Team Data"),
                                content: Text(
                                    "${firstName} ${lastName} is remove in the team."),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Get.back(); // Close the dialog
                                    },
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(fontSize: 14.sp),
                                    ),
                                  ),
                                  TextButton(
                                    onPressed: onPressedDelete,
                                    child: Text(
                                      "Remove",
                                      style: TextStyle(
                                          fontSize: 14.sp, color: Colors.red),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          child: Text(
                            "Delete to Team",
                            style:
                                TextStyle(fontSize: 12.sp, color: Colors.red),
                          ),
                        )
                      ],
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(right: 5.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: onPressedAdd,
                          child: Text(
                            "Add to Team",
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        )
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
