import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'pages/apple-login-page.dart';
import 'router/routes.dart';

final getStorage = GetStorage();

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = NoCheckCertificateHttpOverrides();
  await GetStorage.init();
  await dotenv.load(fileName: 'assets/env/.env');
  runApp(MyApp());
}

class NoCheckCertificateHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: AloginPage(),
      theme: ThemeData(
        fontFamily: 'PretendardGOV',
        splashColor: Colors.transparent,
        useMaterial3: true,
      ),
      getPages: AppRoutes.routes,
      initialRoute: '/login',
      defaultTransition: Transition.cupertino,
    );
  }
}
