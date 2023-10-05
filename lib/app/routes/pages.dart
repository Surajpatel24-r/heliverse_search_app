import 'package:get/get.dart';
import 'package:heliverse_search_app/app/modules/home/binding.dart';
import 'package:heliverse_search_app/app/modules/home/view/view.dart';

class GetPages {
  static final pages = [
    GetPage(
      name: '/',
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
