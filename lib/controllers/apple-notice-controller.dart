import 'package:get/get.dart';

import '../global/g_dio.dart';

class AppleNoticeController extends GetxController {
  // 공지 가져오기 - 성공
  noticeGet() async {
    var res = await dio.get('/notice/get');
  }

  // 공지 생성하기 - 성공
  noticeCreate() async {
    var res = await dio.post('/notice/create', data: {
      'userId': '6f29d61a-b322-4507-9006-7362d7506dd2',
      'noticeCategory': 'nomal-test',
      'noticeTitle': 'string',
      'noticeDesc': 'string',
      'noticeActive': true
    });
  }

  // 공지 수정하기 - 성공
  noticeUpdate() async {
    var res = await dio.put('/notice/update', data: {
      'id': '95dd345c-47e5-41c9-be32-164321e03f47',
      'noticeCategory': 'normal-test-123',
      'noticeTitle': 'string',
      'noticeDesc': 'string',
      'noticeActive': true
    });
  }

  // 공지 삭제하기 - 성공공
  noticeDelete() async {
    var res = await dio.delete('/notice/delete',
        data: {'id': '95dd345c-47e5-41c9-be32-164321e03f47'});
  }
}
