import 'package:apple_highland/global/g_dio.dart';
import 'package:get/get.dart';

class AppleInquiriesController extends GetxController {
  inquiriesGet() async {
    var res = await dio.get('/inquiries/get');
  }
}
