import 'package:apple_highland/controllers/apple-login-page-controller.dart';
import 'package:apple_highland/main.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:apple_highland/controllers/apple-home-page-controller.dart';

AhomePageController controller = Get.put(AhomePageController());

mypage() {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '마이페이지',
          style: TextStyle(
              fontSize: 16,
              color: Color(0xFF4D2E1C),
              fontWeight: FontWeight.w600),
        ),
        Gap(20),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xFFFAFAFA),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(10),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                        child: Image.asset('assets/logo/apple_logo.png')),
                  )
                ],
              ),
              Gap(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(getStorage.read('email') ?? ''),
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                                child: Text(
                              '로그아웃',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )),
                            Gap(10),
                            Divider(
                              color: Colors.grey[200],
                            ),
                            Gap(10),
                            SizedBox(
                              child: Text(
                                '로그아웃 하시겠습니까?',
                                style: TextStyle(
                                    color: Color(0xFF343434), fontSize: 14),
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
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey[200],
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 35, vertical: 10),
                                    child: Center(
                                      child: Text(
                                        '닫기',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 14),
                                      ),
                                    ),
                                  ),
                                ),
                                Gap(15),
                                GestureDetector(
                                  onTap: () {
                                    controller.logOut();
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.blue[200],
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 35, vertical: 10),
                                    child: Center(
                                      child: Text(
                                        '확인',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 14),
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
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.red[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    '로그아웃',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
        Gap(20),
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text('설정 및 관리'),
        ),
        GestureDetector(
          onTap: () {
            controller.tabIndex.value = 8;
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xFFFAFAFA),
            ),
            child: Text('개인정보 수정'),
          ),
        ),
        Gap(10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xFFFAFAFA),
          ),
          child: Text('쇼핑몰 관리'),
        ),
        Gap(10),
        GestureDetector(
          onTap: () {
            controller.isExpanded.value == false
                ? controller.isExpanded.value = true
                : controller.isExpanded.value = false;
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Color(0xFFFAFAFA),
            ),
            child: Row(
              children: [
                Text('상품 관리'),
                Spacer(),
                Icon(controller.isExpanded.value
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down)
              ],
            ),
          ),
        ),
        Obx(
          () => AnimatedSize(
            duration: Duration(milliseconds: 300),
            curve: Curves.fastEaseInToSlowEaseOut,
            child: controller.isExpanded.value
                ? Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFFAFAFA),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text("- 사과", style: TextStyle(fontSize: 14)),
                        SizedBox(height: 20),
                        Text("- 사과즙", style: TextStyle(fontSize: 14)),
                      ],
                    ),
                  )
                : SizedBox.shrink(), // 닫혔을 때는 빈 공간으로 처리
          ),
        ),
        Gap(10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xFFFAFAFA),
          ),
          child: Text('문의'),
        ),
        Gap(10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xFFFAFAFA),
          ),
          child: Text('자주 묻는 질문'),
        ),
        Gap(10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xFFFAFAFA),
          ),
          child: Text('공지사항'),
        ),
        Gap(10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0xFFFAFAFA),
          ),
          child: Text('상품후기'),
        ),
      ],
    ),
  );
}

privateData() {
  return Container(
    color: Colors.white,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          width: double.infinity,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Builder(
                builder: (context) => IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(Icons.menu_open)),
              ),
              Center(
                child: Text(
                  '개인정보 수정',
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF4D2E1C),
                      fontWeight: FontWeight.w600),
                ),
              ),
              IconButton(
                onPressed: () {
                  controller.tabIndex.value = 0;
                  controller.bottomIndex.value = 0;
                },
                icon: Icon(
                  Icons.home_outlined,
                ),
              ),
            ],
          ),
        ),
        Gap(10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '아이디',
            style: TextStyle(fontSize: 14, color: Color(0xFf343434)),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                color: Color(0xFFF9F9F9),
                border: Border.all(width: 1, color: Color(0xFFC8C8C8)),
                borderRadius: BorderRadius.circular(5)),
            child: Text('홍길동'),
          ),
        ),
        Gap(15),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: const [
              Text(
                '비밀번호',
                style: TextStyle(fontSize: 14, color: Color(0xFF343434)),
              ),
              Gap(5),
              Text(
                '*',
                style: TextStyle(fontSize: 14, color: Color(0xFFFF8484)),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10, right: 20),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFC8C8C8), width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: ' ****************',
                hintStyle: TextStyle(fontSize: 14, color: Color(0xFF343434)),
                suffixIcon: Icon(Icons.visibility_off_outlined)),
          ),
        ),
        Gap(15),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: const [
              Text(
                '비밀번호 확인',
                style: TextStyle(fontSize: 14, color: Color(0xFF343434)),
              ),
              Gap(5),
              Text(
                '*',
                style: TextStyle(fontSize: 14, color: Color(0xFFFF8484)),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: TextField(
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 10, right: 20),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFC8C8C8), width: 1),
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: ' ****************',
                hintStyle: TextStyle(fontSize: 14, color: Color(0xFF343434)),
                suffixIcon: Icon(Icons.visibility_off_outlined)),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            '다시 입력해 주세요.',
            style: TextStyle(fontSize: 12, color: Color(0xFFFF8484)),
          ),
        ),
        Gap(20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xFF856655)),
            child: Center(
              child: Text(
                '저장',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        Container(
          color: Colors.white,
          height: 100,
        )
      ],
    ),
  );
}
