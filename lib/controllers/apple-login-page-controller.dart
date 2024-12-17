import 'dart:developer';

import 'package:apple_highland/global/g_print.dart';
import 'package:apple_highland/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../global/g_dio.dart';

class AppleLoginPageController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  login() async {
    try {
      var res = await dio.post(
        '/auth/login',
        data: {
          'email': email.text,
          'password': password.text,
        },
      );
      if (res.statusCode! >= 200 && res.statusCode! <= 399) {
        inspect(res.data);
        printYellow('this');
        getStorage.remove('token');
        getStorage.write('token', res.data['accessToken']);
        Get.toNamed('/home');
      } else {
        showDialog(
          context: Get.context!,
          builder: (context) {
            return AlertDialog(
              surfaceTintColor: Colors.white,
              shape: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none),
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    child: Center(
                      child: Icon(
                        Icons.error,
                        color: Color(0xFFFF8484),
                      ),
                    ),
                  ),
                  Gap(10),
                  SizedBox(
                    child: Center(
                      child: Text(
                        '로그인 실패',
                        style:
                            TextStyle(color: Color(0xFF343434), fontSize: 14),
                      ),
                    ),
                  ),
                  Gap(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xFFF5F5F5),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 35, vertical: 10),
                          child: Center(
                            child: Text(
                              '닫기',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        );
      }
    } catch (e, s) {
      printRed('로그인 실패 에러 메세지 :$e');
      printRed('로그인 실패 에러 코드 라인 :$s');
    }
  }
}
