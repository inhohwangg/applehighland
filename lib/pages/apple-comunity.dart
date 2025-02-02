import 'dart:developer';

import 'package:apple_highland/controllers/apple-home-page-controller.dart';
import 'package:apple_highland/global/g_time.dart';
import 'package:apple_highland/pages/apple-deliver.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

AhomePageController controller = Get.put(AhomePageController());

comunity() {
  return Obx(() => Container(
        color: Colors.white,
        child: controller.helpCenterIndex.value == 0
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 75,
                    child: Center(
                      child: Text(
                        '커뮤니티',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF4D2E1C),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List<Widget>.generate(
                          controller.comunityCategory.length, (int index) {
                        return RawChip(
                          label: SizedBox(
                            width: 50,
                            child: Text(
                              controller.comunityCategory[index],
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          selected:
                              controller.selectedCategoryIndex.value == index,
                          onSelected: (bool selected) {
                            controller.selectedCategoryIndex.value =
                                selected ? index : 0;
                          },
                          selectedColor: Color(0xFF856655), // 선택된 상태의 색상
                          backgroundColor: Colors.white, // 기본 배경색
                          labelStyle: TextStyle(
                              color: controller.selectedCategoryIndex.value ==
                                      index
                                  ? Colors.white
                                  : Color(0xFF271300)), // 선택 여부에 따른 텍스트 색상
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color: controller.selectedCategoryIndex.value ==
                                      index
                                  ? Color(0xFF856655)
                                  : Color(0xFFECECEC),
                            ),
                          ),
                          showCheckmark: false,
                        );
                      }),
                    ),
                  ),
                  if (controller.selectedCategoryIndex.value == 0)
                    notices(controller.noticeList),
                  if (controller.selectedCategoryIndex.value == 1) helpCenter(),
                  if (controller.selectedCategoryIndex.value == 2)
                    productComment(),
                  Gap(20),
                ],
              )
            : question(controller.helpCenterTitle.value,
                controller.getInquiryList(controller.helpCenterTitle.value)),
      ));
}

notices(item) {
  // getPageItems 함수 정의
  List getPageItems() {
    int startIndex =
        (controller.currentPage.value - 1) * controller.itemsPerPage.value;
    int endIndex = startIndex + controller.itemsPerPage.value;
    endIndex = endIndex > item.length ? item.length : endIndex;
    return item.sublist(startIndex, endIndex);
  }

  return Container(
    child: Column(
      children: [
        Gap(15),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFF5F5F5)),
                child: Row(
                  children: const [
                    Icon(
                      Icons.search,
                      size: 16,
                      color: Color(0xFF646464),
                    ),
                    Gap(10),
                    Text(
                      '검색하세요',
                      style: TextStyle(fontSize: 12, color: Color(0xFF646464)),
                    ),
                    Gap(30),
                  ],
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xFFD9D9D9)),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton(
                  items: controller.dropDownMenuList
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                  onChanged: (value) {
                    controller.dropDownValue.value = value.toString();
                  },
                  icon: Padding(
                    padding: EdgeInsets.only(left: 10), // 아이콘과 텍스트 사이 간격 조정
                    child: Icon(Icons.keyboard_arrow_down),
                  ),
                  value: controller.dropDownValue.value,
                  underline: Container(
                    color: Colors.transparent,
                  ),
                  isDense: true,
                  padding: EdgeInsets.symmetric(vertical: 5),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            // width: double.infinity,
            // height: 50,
            decoration: BoxDecoration(
              color: Color(0xFFF5F5F5),
              border: Border.symmetric(
                  horizontal: BorderSide(width: 1, color: Color(0xFFD9D9D9))),
              // border: Border(
              //     top: BorderSide(width: 1, color: Color(0xFFF5F5F5),),
              //     bottom: BorderSide(width: 1, color: Color(0xFFF5F5F5))),
            ),
            child: Row(
              children: const [
                Expanded(
                  flex: 8,
                  child: Center(
                      child: Text(
                    '제목',
                    style: TextStyle(fontSize: 12, color: Color(0xFF343434)),
                  )),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                      child: Text('등록일',
                          style: TextStyle(
                              fontSize: 12, color: Color(0xFF343434)))),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(Get.context!).size.height * 0.5,
          child: ListView.builder(
            itemCount: getPageItems().length,
            itemBuilder: (context, index) {
              var item = getPageItems()[index];
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: GestureDetector(
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
                                  item['noticeTitle'],
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Gap(10),
                              Divider(
                                color: Colors.grey[200],
                              ),
                              Gap(10),
                              SizedBox(
                                child: Text(
                                  item['noticeDesc'],
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
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey[200],
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 35, vertical: 10),
                                      child: Center(
                                        child: Text(
                                          '닫기',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14),
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
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1, color: Color(0xFFD9D9D9))),
                    ),
                    width: double.infinity,
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 8,
                          child: Text(item['noticeTitle']),
                        ),
                        Expanded(
                            flex: 2,
                            child: Text(DateFormat('MM월 dd일')
                                .format(DateTime.parse(item['createdAt'])))),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Gap(10),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 왼쪽 화살표
                GestureDetector(
                  onTap: () {
                    controller.previousPageGroup();
                  },
                  child: Icon(Icons.arrow_back_ios),
                ),
                Gap(15),
                // 페이지 번호들
                ...List<Widget>.generate(controller.pageGroupSize.value,
                    (index) {
                  int pageNumber = controller.pageGroupStart.value + index;
                  if (pageNumber <= controller.totalPages.value) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          controller.changePage(pageNumber);
                        },
                        child: Text(
                          '$pageNumber',
                          style: TextStyle(
                            fontWeight:
                                controller.currentPage.value == pageNumber
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                            color: controller.currentPage.value == pageNumber
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container(); // 페이지 번호가 전체 페이지 수를 초과하면 빈 컨테이너 반환
                  }
                }),
                Gap(15),
                // 오른쪽 화살표
                GestureDetector(
                  onTap: () {
                    controller.nextPageGroup();
                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            )),
        Gap(50)
      ],
    ),
  );
}

helpCenter() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Material(
            //   color: Colors.transparent,
            //   child: Ink(
            //     child: InkWell(
            //       borderRadius: BorderRadius.circular(5),
            //       onTap: () {
            //         controller.helpCenterIndex.value = 1;
            //         controller.helpCenterTitle.value = '자주 묻는 질문';
            //       },
            //       child: Container(
            //         alignment: Alignment.centerLeft,
            //         decoration: BoxDecoration(
            //           borderRadius: BorderRadius.circular(5),
            //           color: Color(0xFFF9F9F9),
            //         ),
            //         child: Chip(
            //           avatar: Icon(Icons.contact_support_outlined,
            //               color: Color(0xFF646464)),
            //           label: Text(
            //             '자주 묻는 질문',
            //             style:
            //                 TextStyle(color: Color(0xFF343434), fontSize: 12),
            //           ),
            //           backgroundColor: Color(0xFFF9F9F9),
            //           shape: RoundedRectangleBorder(
            //               borderRadius:
            //                   BorderRadius.circular(5), // borderRadius 설정
            //               side: BorderSide.none),
            //           side: BorderSide.none,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // 배송문의
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: Ink(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () {
                      controller.helpCenterIndex.value = 1;
                      controller.helpCenterTitle.value = '배송문의';
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFF9F9F9),
                      ),
                      child: Chip(
                        avatar: Icon(Icons.local_shipping_outlined,
                            color: Color(0xFF646464)),
                        label: Text(
                          '배송문의',
                          style:
                              TextStyle(color: Color(0xFF343434), fontSize: 12),
                        ),
                        backgroundColor: Color(0xFFF9F9F9),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(5), // borderRadius 설정
                            side: BorderSide.none),
                        side: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20), // 두 Chip 사이 공간

            // 두 번째 Chip
            // 상품문의
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: Ink(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () {
                      controller.helpCenterIndex.value = 1;
                      controller.helpCenterTitle.value = '상품문의';
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFF9F9F9),
                      ),
                      child: Chip(
                        avatar: SvgPicture.asset('assets/logo/nutrition.svg'),
                        label: Text(
                          '상품문의',
                          style:
                              TextStyle(color: Color(0xFF343434), fontSize: 12),
                        ),
                        backgroundColor: Color(0xFFF9F9F9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        side: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10), // Row 간 간격
        // 두 번째 Row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 첫 번째 Chip
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: Ink(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () {
                      controller.helpCenterIndex.value = 1;
                      controller.helpCenterTitle.value = '자주 묻는 질문';
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFF9F9F9),
                      ),
                      child: Chip(
                        avatar: Icon(Icons.contact_support_outlined,
                            color: Color(0xFF646464)),
                        label: Text(
                          '자주 묻는 질문',
                          style:
                              TextStyle(color: Color(0xFF343434), fontSize: 12),
                        ),
                        backgroundColor: Color(0xFFF9F9F9),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(5), // borderRadius 설정
                            side: BorderSide.none),
                        side: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20), // 두 Chip 사이 공간
            // 두 번째 Chip
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: Ink(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () {
                      controller.helpCenterIndex.value = 1;
                      controller.helpCenterTitle.value = '반품 / 교환 문의';
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFF9F9F9),
                      ),
                      child: Chip(
                        avatar: Icon(Icons.autorenew_outlined,
                            color: Color(0xFF646464)),
                        label: Text(
                          '반품 / 교환 문의',
                          style:
                              TextStyle(color: Color(0xFF343434), fontSize: 12),
                        ),
                        backgroundColor: Color(0xFFF9F9F9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        side: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        // 세 번째 Row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 첫 번째 Chip
            Expanded(
              child: Material(
                color: Colors.transparent,
                child: Ink(
                  child: InkWell(
                    onTap: () {
                      controller.helpCenterIndex.value = 1;
                      controller.helpCenterTitle.value = '기타 문의';
                    },
                    child: Container(
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFF9F9F9),
                      ),
                      child: Chip(
                        avatar:
                            Icon(Icons.sell_outlined, color: Color(0xFF646464)),
                        label: Text(
                          '기타 문의',
                          style:
                              TextStyle(color: Color(0xFF343434), fontSize: 12),
                        ),
                        backgroundColor: Color(0xFFF9F9F9),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(5), // borderRadius 설정
                            side: BorderSide.none),
                        side: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20), // 두 Chip 사이 공간
            // 두 번째 Chip
            Expanded(
              child: Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Chip(
                  avatar: Icon(
                    Icons.autorenew_outlined,
                    color: Colors.transparent,
                  ),
                  label: Text(
                    '반품 / 교환 문의',
                    style: TextStyle(color: Colors.transparent, fontSize: 12),
                  ),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  side: BorderSide.none,
                ),
              ),
            ),
          ],
        ),
        Gap(20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFF5F5F5)),
                child: Row(
                  children: const [
                    Icon(
                      Icons.search,
                      size: 16,
                      color: Color(0xFF646464),
                    ),
                    Gap(10),
                    Text(
                      '검색하세요',
                      style: TextStyle(fontSize: 12, color: Color(0xFF646464)),
                    ),
                    Gap(30),
                  ],
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xFFD9D9D9)),
                    borderRadius: BorderRadius.circular(5)),
                child: DropdownButton(
                  items: controller.dropDownMenuList
                      .map((item) => DropdownMenuItem(
                            value: item,
                            child: Text(
                              item,
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFF343434),
                                  fontWeight: FontWeight.w400),
                            ),
                          ))
                      .toList(),
                  onChanged: (value) {
                    controller.dropDownValue.value = value.toString();
                  },
                  icon: Padding(
                    padding: EdgeInsets.only(left: 10), // 아이콘과 텍스트 사이 간격 조정
                    child: Icon(Icons.keyboard_arrow_down),
                  ),
                  value: controller.dropDownValue.value,
                  underline: Container(
                    color: Colors.transparent,
                  ),
                  isDense: true,
                  padding: EdgeInsets.symmetric(vertical: 5),
                ),
              ),
            ],
          ),
        ),
        Gap(10),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            // width: double.infinity,
            // height: 50,
            decoration: BoxDecoration(
              color: Color(0xFFF5F5F5),
              border: Border.symmetric(
                  horizontal: BorderSide(width: 1, color: Color(0xFFD9D9D9))),
              // border: Border(
              //     top: BorderSide(width: 1, color: Color(0xFFF5F5F5),),
              //     bottom: BorderSide(width: 1, color: Color(0xFFF5F5F5))),
            ),
            child: Row(
              children: const [
                Expanded(
                  flex: 8,
                  child: Center(
                      child: Text(
                    '제목',
                    style: TextStyle(fontSize: 12, color: Color(0xFF343434)),
                  )),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                      child: Text('등록일',
                          style: TextStyle(
                              fontSize: 12, color: Color(0xFF343434)))),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(Get.context!).size.height * 0.5,
          child: Obx(
            () => ListView.builder(
              itemCount: controller.productInquiryList.length,
              itemBuilder: (context, index) {
                var item = controller.productInquiryList[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
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
                                  child: Center(
                                    child: Text(
                                      '상품 문의',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Gap(20),
                                Text(
                                  '문의 내용',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Divider(
                                  color: Colors.grey[200],
                                ),
                                Gap(20),
                                Text(
                                  'Q. ${item['inquiryTitle']}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14),
                                ),
                                Gap(20),
                                Text(
                                  item['inquiryDesc'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13),
                                ),
                                Gap(10),
                                Text(
                                  koreanTime(item['createdAt']),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey[500],
                                      fontSize: 12),
                                ),
                                Gap(30),
                                Text(
                                  '답변',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                Divider(
                                  color: Colors.grey[200],
                                ),
                                Gap(20),
                                Text(
                                  item['inquiryAnswer'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13),
                                ),
                                Gap(10),
                                Text(
                                  item['answerAt'].split('T').first,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey[500],
                                      fontSize: 12),
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
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.grey[200],
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 35, vertical: 10),
                                        child: Center(
                                          child: Text(
                                            '닫기',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14),
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
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 1, color: Color(0xFFD9D9D9))),
                      ),
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 7,
                            child: Text(item['inquiryTitle']),
                          ),
                          Expanded(
                              flex: 2,
                              child: Text(DateFormat('MM월 dd일')
                                  .format(DateTime.parse(item['createdAt'])))),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}

// 상품후기
productComment() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        Gap(15),
        Row(
          children: [
            ActionChip(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              side: BorderSide.none,
              color: WidgetStatePropertyAll(Color(0xFFF5F5F5)),
              backgroundColor: Color(0xFFF5F5F5),
              // color: Color(0xFFF5F5F5),
              avatar: Icon(
                Icons.search,
                color: Color(0xFF343434),
              ),
              label: Text(
                '검색하세요',
                style: TextStyle(
                    fontSize: 12,
                    color: Color(0xFF343434),
                    fontWeight: FontWeight.w400),
              ),
              labelPadding: EdgeInsets.only(left: 10, right: 30),
              labelStyle: TextStyle(
                  color: Color(0xFF646464),
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xFFD9D9D9)),
                  borderRadius: BorderRadius.circular(5)),
              child: DropdownButton(
                items: controller.dropDownMenuList
                    .map((item) => DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        ))
                    .toList(),
                onChanged: (value) {
                  controller.dropDownValue.value = value.toString();
                },
                icon: Padding(
                  padding: EdgeInsets.only(left: 10), // 아이콘과 텍스트 사이 간격 조정
                  child: Icon(Icons.keyboard_arrow_down),
                ),
                value: controller.dropDownValue.value,
                underline: Container(
                  color: Colors.transparent,
                ),
                isDense: true,
                padding: EdgeInsets.symmetric(vertical: 5),
              ),
            ),
          ],
        ),
        Gap(10),
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          // width: double.infinity,
          // height: 50,
          decoration: BoxDecoration(
            color: Color(0xFFF5F5F5),
            border: Border.symmetric(
                horizontal: BorderSide(width: 1, color: Color(0xFFD9D9D9))),
            // border: Border(
            //     top: BorderSide(width: 1, color: Color(0xFFF5F5F5),),
            //     bottom: BorderSide(width: 1, color: Color(0xFFF5F5F5))),
          ),
          child: Row(
            children: const [
              Expanded(
                flex: 8,
                child: Center(
                    child: Text(
                  '후기',
                  style: TextStyle(fontSize: 12, color: Color(0xFF343434)),
                )),
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: MediaQuery.of(Get.context!).size.height * 0.5,
          child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Color(0xFFD9D9D9))),
                ),
                // width: double.infinity,
                // height: 50,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          '시나골드 1박스',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF828282)),
                        ),
                        Gap(20),
                        Icon(
                          Icons.star,
                          color: Color(0xFFFFD900),
                        ),
                        Text(
                          '5.0',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF222222)),
                        )
                      ],
                    ),
                    Gap(10),
                    Text(
                        '오늘은 무엇을 먹어야하는가 오늘은 무엇을 먹어야하는가 오늘은 무엇을 먹어야하는가 오늘은 무엇을 먹어야하는가 오늘은 무엇을 먹어야하는가 오늘은 무엇을 먹어야하는가'),
                    Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        for (var i = 0; i < 3; i++) ...[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(
                              'assets/images/farm_info2.png',
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Gap(10),
                        ]
                      ],
                    ),
                    Gap(10),
                    Row(
                      children: const [
                        Text(
                          '2024.09.11',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF828282)),
                        ),
                        Gap(10),
                        Text(
                          '|',
                          style:
                              TextStyle(fontSize: 12, color: Color(0xFF828282)),
                        ),
                        Gap(10),
                        Text(
                          'data',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFF828282)),
                        ),
                      ],
                    ),
                    Gap(5),
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '[신고]',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF828282)),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        Gap(30),
        Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 왼쪽 화살표
                GestureDetector(
                  onTap: () {
                    controller.previousPageGroup();
                  },
                  child: Icon(Icons.arrow_back_ios),
                ),
                Gap(15),
                // 페이지 번호들
                ...List<Widget>.generate(controller.pageGroupSize.value,
                    (index) {
                  int pageNumber = controller.pageGroupStart.value + index;
                  if (pageNumber <= controller.totalPages.value) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          controller.changePage(pageNumber);
                        },
                        child: Text(
                          '$pageNumber',
                          style: TextStyle(
                            fontWeight:
                                controller.currentPage.value == pageNumber
                                    ? FontWeight.bold
                                    : FontWeight.normal,
                            color: controller.currentPage.value == pageNumber
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  } else {
                    return Container(); // 페이지 번호가 전체 페이지 수를 초과하면 빈 컨테이너 반환
                  }
                }),
                Gap(15),
                // 오른쪽 화살표
                GestureDetector(
                  onTap: () {
                    controller.nextPageGroup();
                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            )),
      ],
    ),
  );
}
