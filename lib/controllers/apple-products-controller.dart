import 'package:apple_highland/global/g_dio.dart';
import 'package:apple_highland/global/g_print.dart';
import 'package:get/get.dart';

class AppleProductsController extends GetxController {
  productGet() async {
    try {
      var res = await dio.get('/products/get');
    } catch (e, s) {
      printRed('상품 가져오기 에러 메세지 : $e');
      printRed('상품 가져오기 에러 코드 라인 : $s');
    }
  }
}
