import 'dart:developer';

import 'package:apple_highland/global/g_dio.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class AppleSplashPage extends StatefulWidget {
  const AppleSplashPage({super.key});

  @override
  State<AppleSplashPage> createState() => _AppleSplashPageState();
}

class _AppleSplashPageState extends State<AppleSplashPage> {
  List menuList = [];

  @override
  void initState() {
    super.initState();
    menuGet();
    Future.delayed(const Duration(seconds: 2), () {
      Get.toNamed('/home', arguments: {'menuList': menuList});
    });
  }

  Future<void> menuGet() async {
    menuList.clear();
    var res = await dio.get('/menu/get');
    menuList.addAll(res.data['data']['rows']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFECE9),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'data',
            style: TextStyle(color: Colors.transparent),
          ),
          Spacer(),
          Center(
            child: Image.asset('assets/images/splash-image.png'),
          ),
          Spacer(),
          Center(
            child: CircularProgressIndicator(
              color: Color(0xFF30180B),
            ),
          ),
          Gap(15)
        ],
      ),
    );
  }
}
