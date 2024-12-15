import 'dart:developer';

import 'package:apple_highland/global/g_print.dart';
import 'package:apple_highland/main.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
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
      inspect(res);
      if (res.statusCode! >= 200 && res.statusCode! <= 399) {
        getStorage.write('token', res.data['accessToken']);
      }
    } catch (e, s) {
      printRed('로그인 실패 에러 메세지 :$e');
      printRed('로그인 실패 에러 코드 라인 :$s');
    }
  }
}
