import 'dart:developer';

import 'package:apple_highland/global/g_dio.dart';
import 'package:apple_highland/global/g_print.dart';
import 'package:apple_highland/main.dart';
import 'package:get/get.dart';

class AhomePageController extends GetxController {
  RxList farmInfoList = ['farm_info3.png', 'farm_info4.png'].obs;
  RxList farmInfoList2 = ['carousel_image3.jpg', 'carousel_image4.jpg'].obs;
  RxList farmInfoTextList1 = ['정직한 사과', '싱싱한 사과'].obs;
  RxList farmInfoTextList2 = ['나의 가족이 먹는다는 마음으로', '애플 하이랜드는 GAP 인증을 받았으며'].obs;
  RxList farmInfoTextList3 =
      ['언제나 정직하게 좋은 사과만을 골라 드립니다.', '건강하고 싱싱한 사과만을 고집합니다.'].obs;
  RxInt carouselIndex1 = 0.obs;
  RxInt carouselIndex2 = 0.obs;
  RxInt bottomIndex = 0.obs;
  RxInt tabIndex = 0.obs;
  RxList category = ["전체", "가정용", "선물용"].obs;
  RxList comunityCategory = ["공지사항", "고객센터", "상품후기"].obs;
  RxList tabs = ["낮은가격", "높은가격", "판매순위", "상품평"].obs;
  RxList dropDownMenuList = ['전체보기', '일부보기', '하나보기'].obs;
  RxString dropDownValue = '전체보기'.obs;
  RxInt selectedCategoryIndex = 0.obs;
  RxInt selectedIndex = 0.obs;
  RxInt itemsPerPage = 6.obs; // 페이지당 항목 수
  RxInt currentPage = 1.obs; // 현재 페이지
  RxInt totalItems = 100.obs; // 전체 페이지 수
  RxInt totalPages = 1.obs; // 전체 페이지 수
  RxInt pageGroupSize = 3.obs; // 한번에 표시할 페이지 번호 수
  RxInt pageGroupStart = 1.obs; // 현재 페이지 그룹의 시작 페이지 번호
  RxInt helpCenterIndex = 0.obs;
  RxString helpCenterTitle = ''.obs;
  RxBool secretValue = false.obs;
  RxList appleProductsList = [].obs;
  RxList noticeList = [].obs;
  RxList productInquiryList = [].obs;
  RxList deliveryInquiryList = [].obs;
  RxList exchangeInquiryList = [].obs;
  RxList etcInquiryList = [].obs;
  RxBool isAdmingLoading = false.obs;

  RxList adminMenuList = [
    {'name': '주문 내역 관리', 'count': 0},
    {'name': '상품 관리', 'count': 0},
    {'name': '문의 관리', 'count': 0},
    {'name': '상품 후기', 'count': 0},
    {'name': '공지사항', 'count': 0},
    // {'name': '사이트 관리', 'count': 0},
    // {'name': '개인정보 수정', 'count': 0},
  ].obs;

  RxList productIntroduceList = [
    {
      'name': '감홍',
      'image_path': 'assets/images/product_info1.png',
      'storage_period': '약 2주 - 3주',
      'storage_method': '냉장고에 과일 칸에 신문지로 싸서 보관.\n통풍 유지',
      'product_out_time': '9월 중순 - 9월 말',
      'flavor': '당도가 높고 산미가 적당해\n조화로운 맛.\n과육이 단단하고 향이 강함.'
    },
    {
      'name': '시나골드',
      'image_path': 'assets/images/product_info2.png',
      'storage_period': '약 1개월',
      'storage_method': '냉장고에 밀폐 용기 또는 랩으로 싸서 보관.\n습기를 유지하며 온도 변화 최소화',
      'product_out_time': '10월 중순 - 10월 말',
      'flavor': '달콤한 맛이 강하며 약간의 산미가 있어 균형감이 우수.\n과목이 단단하고 저장성이 좋음'
    },
    {
      'name': '부사',
      'image_path': 'assets/images/product_info3.png',
      'storage_period': '약 2주',
      'storage_method': '냉장고에 과일 칸에 보관.\n사과 표면 물기를 닦고 종이로 감싸 개별 보관',
      'product_out_time': '10월 초 - 10월 중순',
      'flavor': '매우 달콤하고 향이 진한 품종.\n과육이 부드럽고 과즙이 풍부함.'
    },
    {
      'name': '홍로',
      'image_path': 'assets/images/product_info3.png',
      'storage_period': '약 1개월 - 2개월',
      'storage_method': '냉장고 과일 칸에 신문지로 싸서 개별 보관.\n온도와 습도 일정하게 유지',
      'product_out_time': '11월 초 - 11월 말',
      'flavor': '달콤하면서도 약간의 신맛이 있어 깊은 풍미.\n과육이 단단하고 저장성이 가장 뛰어남'
    },
  ].obs;

  RxInt productIntroduceIndex = 0.obs;

  RxList eventList = [
    {'title': '[이벤트] 당첨자 명단 확인', 'date': '24.09.03'},
    {'title': '[이벤트] 당첨자 명단 확인', 'date': '24.09.03'},
    {'title': '[이벤트] 당첨자 명단 확인', 'date': '24.09.03'},
    {'title': '[이벤트] 당첨자 명단 확인', 'date': '24.09.03'},
    {'title': '[이벤트] 당첨자 명단 확인', 'date': '24.09.03'},
    {'title': '[이벤트] 당첨자 명단 확인', 'date': '24.09.03'},
    {'title': '[이벤트] 당첨자 명단 확인1', 'date': '24.09.04'},
    {'title': '[이벤트] 당첨자 명단 확인1', 'date': '24.09.04'},
    {'title': '[이벤트] 당첨자 명단 확인1', 'date': '24.09.04'},
    {'title': '[이벤트] 당첨자 명단 확인1', 'date': '24.09.04'},
    {'title': '[이벤트] 당첨자 명단 확인1', 'date': '24.09.04'},
    {'title': '[이벤트] 당첨자 명단 확인1', 'date': '24.09.04'},
    {'title': '[이벤트] 당첨자 명단 확인2', 'date': '24.09.05'},
    {'title': '[이벤트] 당첨자 명단 확인2', 'date': '24.09.05'},
    {'title': '[이벤트] 당첨자 명단 확인2', 'date': '24.09.05'},
    {'title': '[이벤트] 당첨자 명단 확인2', 'date': '24.09.05'},
    {'title': '[이벤트] 당첨자 명단 확인2', 'date': '24.09.05'},
    {'title': '[이벤트] 당첨자 명단 확인2', 'date': '24.09.05'},
    {'title': '[이벤트] 당첨자 명단 확인3', 'date': '24.09.06'},
    {'title': '[이벤트] 당첨자 명단 확인3', 'date': '24.09.06'},
    {'title': '[이벤트] 당첨자 명단 확인3', 'date': '24.09.06'},
    {'title': '[이벤트] 당첨자 명단 확인3', 'date': '24.09.06'},
    {'title': '[이벤트] 당첨자 명단 확인3', 'date': '24.09.06'},
    {'title': '[이벤트] 당첨자 명단 확인3', 'date': '24.09.06'},
  ].obs;

  RxList qstList = [
    {
      'title': '[배송문의] 당첨자 명단 확인',
      'secret': true,
      'status': '답변완료',
      'date': '24.09.03'
    },
    {
      'title': '[배송문의] 당첨자 명단 확인',
      'secret': true,
      'status': '답변완료',
      'date': '24.09.03'
    },
    {
      'title': '[배송문의] 당첨자 명단 확인',
      'secret': false,
      'status': '답변대기',
      'date': '24.09.03'
    },
    {
      'title': '[배송문의] 당첨자 명단 확인',
      'secret': false,
      'status': '답변대기',
      'date': '24.09.03'
    },
    {
      'title': '[배송문의] 당첨자 명단 확인',
      'secret': false,
      'status': '답변대기',
      'date': '24.09.03'
    },
    {
      'title': '[배송문의] 당첨자 명단 확인',
      'secret': false,
      'status': '답변대기',
      'date': '24.09.03'
    },
    {
      'title': '[배송문의] 당첨자 명단 확인1',
      'secret': false,
      'status': '답변대기',
      'date': '24.09.04'
    },
    {
      'title': '[배송문의] 당첨자 명단 확인1',
      'secret': false,
      'status': '답변대기',
      'date': '24.09.04'
    },
    {
      'title': '[배송문의] 당첨자 명단 확인1',
      'secret': false,
      'status': '답변대기',
      'date': '24.09.04'
    },
    {
      'title': '[배송문의] 당첨자 명단 확인1',
      'secret': false,
      'status': '답변대기',
      'date': '24.09.04'
    },
    {
      'title': '[배송문의] 당첨자 명단 확인1',
      'secret': false,
      'status': '답변대기',
      'date': '24.09.04'
    },
    {
      'title': '[배송문의] 당첨자 명단 확인1',
      'secret': false,
      'status': '답변대기',
      'date': '24.09.04'
    },
    {
      'title': '[배송문의] 당첨자 명단 확인2',
      'secret': false,
      'status': '답변대기',
      'date': '24.09.05'
    },
    {
      'title': '[배송문의] 당첨자 명단 확인2',
      'secret': false,
      'status': '답변대기',
      'date': '24.09.05'
    },
    {
      'title': '[배송문의] 당첨자 명단 확인2',
      'secret': false,
      'status': '답변대기',
      'date': '24.09.05'
    },
    {
      'title': '[배송문의] 당첨자 명단 확인2',
      'secret': false,
      'status': '답변대기',
      'date': '24.09.05'
    },
    {
      'title': '[배송문의] 당첨자 명단 확인2',
      'secret': false,
      'status': '답변대기',
      'date': '24.09.05'
    },
    {
      'title': '[배송문의] 당첨자 명단 확인2',
      'secret': false,
      'status': '답변대기',
      'date': '24.09.05'
    },
    {
      'title': '[배송문의] 당첨자 명단 확인3',
      'secret': false,
      'status': '답변대기',
      'date': '24.09.06'
    },
    {
      'title': '[배송문의] 당첨자 명단 확인3',
      'secret': false,
      'status': '답변대기',
      'date': '24.09.06'
    },
    {
      'title': '[배송문의] 당첨자 명단 확인3',
      'secret': false,
      'status': '답변대기',
      'date': '24.09.06'
    },
    {
      'title': '[배송문의] 당첨자 명단 확인3',
      'secret': false,
      'status': '답변대기',
      'date': '24.09.06'
    },
    {
      'title': '[배송문의] 당첨자 명단 확인3',
      'secret': false,
      'status': '답변대기',
      'date': '24.09.06'
    },
    {
      'title': '[배송문의] 당첨자 명단 확인3',
      'secret': false,
      'status': '답변대기',
      'date': '24.09.06'
    },
  ].obs;

  RxList eventTestList = [
    {'title': '[이벤트] ', 'secret': true, 'status': '답변완료', 'date': '24.09.03'},
    {'title': '[이벤트] ', 'secret': true, 'status': '답변완료', 'date': '24.09.03'},
    {'title': '[이벤트] ', 'secret': false, 'status': '답변완료', 'date': '24.09.03'},
    {'title': '[이벤트] ', 'secret': false, 'status': '답변완료', 'date': '24.09.03'},
    {'title': '[이벤트] ', 'secret': false, 'status': '답변완료', 'date': '24.09.03'},
    {'title': '[이벤트] ', 'secret': false, 'status': '답변완료', 'date': '24.09.03'},
    {'title': '[이벤트] ', 'secret': false, 'status': '답변대기', 'date': '24.09.04'},
    {'title': '[이벤트] ', 'secret': false, 'status': '답변대기', 'date': '24.09.04'},
    {'title': '[이벤트] ', 'secret': false, 'status': '답변대기', 'date': '24.09.04'},
    {'title': '[이벤트] ', 'secret': false, 'status': '답변대기', 'date': '24.09.04'},
    {'title': '[이벤트] ', 'secret': false, 'status': '답변완료', 'date': '24.09.04'},
    {'title': '[이벤트] ', 'secret': false, 'status': '답변완료', 'date': '24.09.04'},
    {'title': '[이벤트] ', 'secret': false, 'status': '답변완료', 'date': '24.09.05'},
    {'title': '[이벤트] ', 'secret': false, 'status': '답변완료', 'date': '24.09.05'},
    {'title': '[이벤트] ', 'secret': false, 'status': '답변완료', 'date': '24.09.05'},
    {'title': '[이벤트] ', 'secret': false, 'status': '답변완료', 'date': '24.09.05'},
    {'title': '[이벤트] ', 'secret': false, 'status': '답변완료', 'date': '24.09.05'},
  ].obs;

  RxList faqs = [
    {
      'faqTitle': '[배송문의]',
      'title': '애플 하이랜드에서 오늘 주문하면 얼마나 걸리나요?',
      'content': '평일 기준으로 최대 1 ~ 3일 , 최소 1 ~ 2일 정도 소요됩니다.',
      'isExpanded': false.obs
    },
    {
      'faqTitle': '[자주 묻는 질문]',
      'title': '사과는 어떻게 보관해야 하나요?',
      'content': '사과는 서늘하고 건조한 곳에 보관하는 것이 좋습니다. 냉장고에 보관하면 신선도를 오래 유지할 수 있습니다.',
      'isExpanded': false.obs
    },
    {
      'faqTitle': '[반품 / 교환문의]',
      'title': '반품 및 환불 정책은 어떻게 되나요?',
      'content': '상품 수령 후 7일 이내에 반품 요청이 가능합니다. 단! 사과의 상태가 양호할 경우 전액 환불이 가능합니다.',
      'isExpanded': false.obs
    },
    {
      'faqTitle': '[상품문의]',
      'title': '사과의 종류는 어떤 것이 있나요?',
      'content':
          '애플 하이랜드에서는 다양한 사과를 판매하고있습니다. 감홍 , 시나골드 , 부사 , 아리수 , 홍로 ,사과즙 등이 있으며, 각 종류마다 맛과 특성이 다릅니다.',
      'isExpanded': false.obs
    },
    {
      'faqTitle': '[기타문의]',
      'title': '사과의 영양성분은 어떤 것이 있나요?',
      'content': '사과는 비타민 C , 식이섬유 , 항산화 물질이 풍부하여 건강에 매우 유익합니다.',
      'isExpanded': false.obs
    },
  ].obs;
  RxBool isExpanded = false.obs;

  @override
  void onInit() {
    super.onInit();
    tabIndex.value = 0;
    totalItems.value = eventList.length;
    totalPages.value = (totalItems.value / itemsPerPage.value).ceil();
    categoryGet();
    noticeGet();
    inquiryGet();
  }

  // 페이지 변경 함수
  void changePage(int page) {
    if (page >= 1 && page <= totalPages.value) {
      currentPage.value = page;
    }
  }

  // 페이지 그룹 변경 함수
  void nextPageGroup() {
    int newStart = pageGroupStart.value + pageGroupSize.value;
    if (newStart <= totalPages.value) {
      pageGroupStart.value = newStart;
      currentPage.value = pageGroupStart.value;
    } else {
      pageGroupStart.value = ((totalPages.value = 1) ~/ pageGroupSize.value) *
              pageGroupSize.value +
          1;
      currentPage.value = pageGroupStart.value;
    }
  }

  void previousPageGroup() {
    int newStart = pageGroupStart.value - pageGroupSize.value;
    if (newStart >= 1) {
      pageGroupStart.value = newStart;
      currentPage.value = pageGroupSize.value; // 페이지 그룹의 첫 번쨰 페이지로 이동
    } else {
      pageGroupStart.value = 1;
      currentPage.value = 1; // 첫 번째 페이지로 이동
    }
  }

  // 카테고리 가져오기
  categoryGet() async {
    try {
      appleProductsList.clear();
      var res = await dio.get('/categories/get', queryParameters: {
        'from': 0,
        'size': 30,
      });
      var resProduct = await dio.get('/products/get', data: {
        'from': 0,
        'size': 30,
        'categoryId': res.data['data']['rows'].first['id']
      });
      appleProductsList.addAll(resProduct.data['data']['rows']);
    } catch (e, s) {
      printRed('과일소개 과일 가져오기 에러 메세지 : $e');
      printRed('과일소개 과일 가져오기 에러 코드 라인 : $s');
    }
  }

  noticeGet() async {
    noticeList.clear();
    var res = await dio.get('/notice/get');
    adminMenuList[4]['count'] = res.data['data']['rows'].length;
    inspect(adminMenuList);
    noticeList.addAll(res.data['data']['rows']);
  }

  // 상품문의 가져오기기
  inquiryGet() async {
    try {
      productInquiryList.clear();
      deliveryInquiryList.clear();
      exchangeInquiryList.clear();
      etcInquiryList.clear();
      isAdmingLoading.value = false;
      var res = await dio.get(
        '/inquiries/get',
        queryParameters: {
          'from': 0,
          'size': 30,
          //    'inquiryCategory': '상품 문의',
        },
      );
      printCyan(res.data['data']['rows'].length);
      isAdmingLoading.value = true;
      adminMenuList[2]['count'] = res.data['data']['rows'].length;
      for (var inquiry in res.data['data']['rows']) {
        if (inquiry['inquiryCategory'].contains('상품')) {
          productInquiryList.add(inquiry);
        } else if (inquiry['inquiryCategory'].contains('배송')) {
          deliveryInquiryList.add(inquiry);
        } else if (inquiry['inquiryCategory'].contains('교환')) {
          exchangeInquiryList.add(inquiry);
        } else if (inquiry['inquiryCategory'].contains('기타')) {
          etcInquiryList.add(inquiry);
        }
      }
    } catch (e, s) {
      printRed('상품 가져오기 에러 메세지 : $e');
      printRed('상품 가져오기 에러 코드 라인 : $s');
    }
  }

  // 사용자 정보 가져오기
  // 카테고리 삭제(임시)

  logOut() {
    tabIndex.value = 0;
    bottomIndex.value = 0;
    getStorage.remove('token');
    Get.offNamed('/login');
  }
}
