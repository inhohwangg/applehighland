import 'dart:developer';

import 'package:apple_highland/global/g_print.dart';
import 'package:get/get.dart';

import '../global/g_dio.dart';

class AppleCategoryController extends GetxController {
  //* 상품 카테고리 생성 -OK
  categoryCreate() async {
    try {
      var res = await dio.post('/categories/create', data: {
        'categoryName': '사과 테스트',
        'categoryUrl': '/product/apple-test'
      });
      inspect(res.data);
    } catch (e, s) {
      printRed('카테고리 전체 조회 에러 메세지 : $e');
      printRed('카테고리 전체 조회 에러 코드 라인 : $s');
    }
  }

  //* 카테고리 조회 - OK
  categoryGet() async {
    try {
      var res = await dio.get('/categories/get');
    } catch (e, s) {
      printRed('카테고리 전체 조회 에러 메세지 : $e');
      printRed('카테고리 전체 조회 에러 코드 라인 : $s');
    }
  }

  // 카테고리 수정 - OK
  categoryUpdate() async {
    try {
      var res = await dio.put('/categories/update', data: {
        'id': '3c909366-6f6d-4958-8ab5-61b853367cbd',
        'categoryName': '사과 테스트1',
        'categoryUrl': '/product/apple-test'
      });
    } catch (e, s) {
      printRed('카테고리 전체 조회 에러 메세지 : $e');
      printRed('카테고리 전체 조회 에러 코드 라인 : $s');
    }
  }

  // 카테고리 삭제 - 물어봐야할듯...
  categoryDelete() async {
    try {
      var res = await dio.delete('/categories/delete', data: {
        ['3c909366-6f6d-4958-8ab5-61b853367cbd'],
      });
    } catch (e, s) {
      printRed('카테고리 전체 조회 에러 메세지 : $e');
      printRed('카테고리 전체 조회 에러 코드 라인 : $s');
    }
  }
}
