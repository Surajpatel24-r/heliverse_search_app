import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app/modules/home/view/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          // theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          title: 'Heliverse',
          // initialRoute: '/',
          // getPages: GetPages.pages,
          home: HomeScreen(),
        );
      },
    );
  }
}
