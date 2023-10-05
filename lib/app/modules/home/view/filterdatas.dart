import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:heliverse_search_app/app/modules/home/controller.dart';

class FilterDataScreen extends StatefulWidget {
  FilterDataScreen({super.key});

  @override
  State<FilterDataScreen> createState() => _FilterDataScreenState();
}

final HomeController _controller = Get.put(HomeController());

class _FilterDataScreenState extends State<FilterDataScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filters",
          style: TextStyle(fontSize: 18.sp),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 10.h),
                      child: Text(
                        "Availability",
                        style: TextStyle(fontSize: 21.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Obx(
                        () => Row(
                          children: [
                            FilterChip(
                              label: Text(
                                'Available',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              selected: _controller.isSelectedAvailable.value,
                              onSelected: (selected) {
                                _controller.selectAvailable();
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              child: FilterChip(
                                label: Text(
                                  'Not Available',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                                selected:
                                    _controller.isSelectedNotAvailable.value,
                                onSelected: (selected) {
                                  _controller.selectNotAvailable();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 10.h),
                      child: Text(
                        "Gender",
                        style: TextStyle(fontSize: 21.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Obx(
                        () => Wrap(
                          runAlignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          spacing: 9.0.w,
                          runSpacing: 5.0.h,
                          children: [
                            FilterChip(
                              label: Text(
                                'Agender',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              selected: _controller
                                  .genderSelections['Agender']!.value,
                              onSelected: (selected) {
                                _controller.toggleGenderSelection('Agender');
                              },
                            ),
                            FilterChip(
                              label: Text(
                                'Bigender',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              selected: _controller
                                  .genderSelections['Bigender']!.value,
                              onSelected: (selected) {
                                _controller.toggleGenderSelection('Bigender');
                              },
                            ),
                            FilterChip(
                              label: Text(
                                'Female',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              selected:
                                  _controller.genderSelections['Female']!.value,
                              onSelected: (selected) {
                                _controller.toggleGenderSelection('Female');
                              },
                            ),
                            FilterChip(
                              label: Text(
                                'Genderfluid',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              selected: _controller
                                  .genderSelections['Genderfluid']!.value,
                              onSelected: (selected) {
                                _controller
                                    .toggleGenderSelection('Genderfluid');
                              },
                            ),
                            FilterChip(
                              label: Text(
                                'Genderqueer',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              selected: _controller
                                  .genderSelections['Genderqueer']!.value,
                              onSelected: (selected) {
                                _controller
                                    .toggleGenderSelection('Genderqueer');
                              },
                            ),
                            FilterChip(
                              label: Text(
                                'Male',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              selected:
                                  _controller.genderSelections['Male']!.value,
                              onSelected: (selected) {
                                _controller.toggleGenderSelection('Male');
                              },
                            ),
                            FilterChip(
                              label: Text(
                                'Non-binary',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              selected: _controller
                                  .genderSelections['Non-binary']!.value,
                              onSelected: (selected) {
                                _controller.toggleGenderSelection('Non-binary');
                              },
                            ),
                            FilterChip(
                              label: Text(
                                'Polygender',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              selected: _controller
                                  .genderSelections['Polygender']!.value,
                              onSelected: (selected) {
                                _controller.toggleGenderSelection('Polygender');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 24.w, vertical: 10.h),
                      child: Text(
                        "Domains",
                        style: TextStyle(fontSize: 21.sp),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 24.w),
                      child: Obx(
                        () => Wrap(
                          runAlignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.start,
                          spacing: 9.0.w,
                          runSpacing: 5.0.h,
                          children: [
                            FilterChip(
                              label: Text(
                                'Business Development',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              selected: _controller
                                  .domainSelections['Business Development']!
                                  .value,
                              onSelected: (selected) {
                                _controller.toggleDomainSelection(
                                    'Business Development');
                              },
                            ),
                            FilterChip(
                              label: Text(
                                'Finance',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              selected: _controller
                                  .domainSelections['Finance']!.value,
                              onSelected: (selected) {
                                _controller.toggleDomainSelection('Finance');
                              },
                            ),
                            FilterChip(
                              label: Text(
                                'IT',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              selected:
                                  _controller.domainSelections['IT']!.value,
                              onSelected: (selected) {
                                _controller.toggleDomainSelection('IT');
                              },
                            ),
                            FilterChip(
                              label: Text(
                                'Management',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              selected: _controller
                                  .domainSelections['Management']!.value,
                              onSelected: (selected) {
                                _controller.toggleDomainSelection('Management');
                              },
                            ),
                            FilterChip(
                              label: Text(
                                'Marketing',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              selected: _controller
                                  .domainSelections['Marketing']!.value,
                              onSelected: (selected) {
                                _controller.toggleDomainSelection('Marketing');
                              },
                            ),
                            FilterChip(
                              label: Text(
                                'Sales',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              selected:
                                  _controller.domainSelections['Sales']!.value,
                              onSelected: (selected) {
                                _controller.toggleDomainSelection('Sales');
                              },
                            ),
                            FilterChip(
                              label: Text(
                                'UI Designing',
                                style: TextStyle(fontSize: 14.sp),
                              ),
                              selected: _controller
                                  .domainSelections['UI Designing']!.value,
                              onSelected: (selected) {
                                _controller
                                    .toggleDomainSelection('UI Designing');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 12.h),
                  child: Container(
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        _controller.applyFilters();
                        Get.back();
                      },
                      child: Center(
                        child: Text(
                          "Apply",
                          style: TextStyle(fontSize: 14.sp),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
