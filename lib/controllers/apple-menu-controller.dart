import 'package:apple_highland/global/g_dio.dart';
import 'package:apple_highland/global/g_print.dart';
import 'package:get/get.dart';

class AppleMenuController extends GetxController {
  //* 메뉴 전체 조회 - 성공
  menuGet() async {
    try {
      var res = await dio.get('/menu/get');
    } catch (e, s) {
      printRed('메뉴 가져오기 에러 메세지 : $e');
      printRed('메뉴 가져오기 에러 코드 라인 : $e');
    }
  }

  //* 메뉴 생성 - 성공
  menuCreate() async {
    var res = await dio.post('/menu/create', data: {
      'menuName': '테스트 메뉴',
      'menuUrl': "/testMenu",
      'menuOrder': 0,
      'active': false
    });
  }

  //* 메뉴 수정 - 실패
  menuUpdate() async {
    var res = await dio.put('/menu/update', data: [
      {
        'menu': '테스트 메뉴1',
        'menuOrder': '0',
        'menuUrl': '/testMenu1',
        'active': false,
        'id': '080ed07a-d60e-4a24-a51c-6c2832f031a6'
      }
    ]);
  }
}
