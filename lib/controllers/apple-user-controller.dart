import 'dart:developer';

import 'package:apple_highland/global/g_dio.dart';
import 'package:apple_highland/global/g_print.dart';
import 'package:apple_highland/main.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class AppleUserController extends GetxController {
  int from = 0;
  int size = 15;

  //* 유저 정보 요청
  userGet() async {
    try {
      printPurple(getStorage.read('token'));
      var res = await dio.get(
        '/users/get',
      );
      inspect(res.data);
    } catch (e, s) {
      printRed('유저정보 불러오기 에러 메세지 : $e');
      printRed('유저정보 불러오기 에러 코드 라인 : $s');
    }
  }

  //* 권한에 맞는 유저 리스트 조회
  userAll() async {
    try {
      var res = await dio.get(
        '/users/getAll',
        queryParameters: {'from': from, 'size': size},
      );
      inspect(res.data);
    } catch (e, s) {
      printRed('전체 유저 조회 에러 메세지 : $e');
      printRed('전체 유저 조회 에러 코드 라인 : $e');
    }
  }

  // products , inquiries, notice, deliveryAddress ,carts, orders, reviews
  // global - site, files, orderItems
}
