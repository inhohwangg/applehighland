import 'package:apple_highland/controllers/apple-login-page-controller.dart';
import 'package:apple_highland/pages/apple-login-page.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String home = '/';

  static List<GetPage> routes = [
    //! splash page
    // GetPage(
    //   name: '/',
    //   page: () => AloginPage(),
    //   transition: Transition.cupertino,
    //   transitionDuration: Duration(milliseconds: 500),
    //   bindings: [
    //     BindingsBuilder(() {
    //       Get.put(AppleLoginPageController());
    //     })
    //   ],
    // ),
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
  ];
}
