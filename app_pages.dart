import 'package:get/get.dart';
import 'package:app1/home/home.dart';
import 'package:app1/home/controllers/home_controller.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: Routes.home,
      page: () => const Home(), // Capitalized class
      binding: BindingsBuilder(() {
        Get.put(HomeController()); // Correct controller
      }),
    ),
  ];
}
