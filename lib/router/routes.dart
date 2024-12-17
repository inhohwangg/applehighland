import 'package:apple_highland/controllers/apple-home-page-controller.dart';
import 'package:apple_highland/controllers/apple-login-page-controller.dart';
import 'package:apple_highland/pages/apple-home-page.dart';
import 'package:apple_highland/pages/apple-login-page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String home = '/';

  static List<GetPage> routes = [
    GetPage(
      name: '/login',
      page: () => AloginPage(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
      bindings: [
        BindingsBuilder(() {
          Get.put(AppleLoginPageController());
        })
      ],
    ),
    GetPage(
      name: '/home',
      page: () => AhomePage(),
      transition: Transition.cupertino,
      transitionDuration: Duration(milliseconds: 500),
      bindings: [
        BindingsBuilder(() {
          Get.put(AhomePageController());
        })
      ],
    ),
  ];
}
