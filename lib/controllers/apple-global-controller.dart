//site, files, orderItems
import 'dart:developer';

import 'package:apple_highland/global/g_print.dart';
import 'package:get/get.dart';

import '../global/g_dio.dart';

class AppleGlobalController extends GetxController {
  fileDownload() async {
    try {
      var res = await dio.get('/files/getFile');
      inspect(res.data);
    } catch (e, s) {
      printRed('파일 다운로드 에러 메세지 : $e');
      printRed('파일 다운로드 에러 코드 라인 : $s');
    }
  }
}
