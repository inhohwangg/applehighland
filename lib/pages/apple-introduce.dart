import 'package:apple_highland/global/g_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:apple_highland/controllers/apple-home-page-controller.dart';
import 'package:gap/gap.dart';

AhomePageController controller = Get.put(AhomePageController());

appleIntroduce() {
  return Container(
    height: MediaQuery.of(Get.context!).size.height * 1,
    color: Colors.white,
    child: Column(
      children: [
        Gap(30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(Get.context!).size.width * 0.5,
              child: Center(
                child: Divider(
                  height: 1,
                  color: Color(0xFFAA9E9E),
                ),
              ),
            )
          ],
        ),
        Gap(15),
        Text('애플 하이랜드의'),
        Gap(10),
        Text('사과를 소개합니다.'),
        Gap(15),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(Get.context!).size.width * 0.5,
              child: Center(
                child: Divider(
                  height: 1,
                  color: Color(0xFFAA9E9E),
                ),
              ),
            )
          ],
        ),
        Gap(30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            controller.productIntroduceList.length,
            (index) {
              return GestureDetector(
                onTap: () {
                  controller.productIntroduceIndex.value = index;
                },
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                          controller.productIntroduceList[index]['image_path']),
                    ),
                    Gap(10),
                    Text(
                      controller.productIntroduceList[index]['name'],
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF30180B)),
                    )
                  ],
                ),
              );
            },
          ),
        ),
        Gap(30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/apple.png',
              width: 30,
              height: 30,
            ),
            Gap(10),
            Obx(
              () => Text(
                controller.productIntroduceList[
                    controller.productIntroduceIndex.value]['name'],
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF343434)),
              ),
            )
          ],
        ),
        Gap(30),
        Obx(
          () => Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Table(
              border: TableBorder.all(
                color: Colors.grey[300]!,
                width: 1,
              ),
              columnWidths: const {
                0: FlexColumnWidth(1),
                1: FlexColumnWidth(2),
              },
              children: [
                _buildTableRow(
                    '보관 가능 기간',
                    controller.productIntroduceList[controller
                        .productIntroduceIndex.value]['storage_period']),
                _buildTableRow(
                    '보관 방법',
                    controller.productIntroduceList[controller
                        .productIntroduceIndex.value]['storage_method']),
                _buildTableRow(
                    '출하 시기',
                    controller.productIntroduceList[controller
                        .productIntroduceIndex.value]['product_out_time']),
                _buildTableRow(
                    '맛과 특징',
                    controller.productIntroduceList[
                        controller.productIntroduceIndex.value]['flavor']),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

// 테이블 로우를 생성하는 함수
TableRow _buildTableRow(String title, String content) {
  return TableRow(
    children: [
      TableCell(
        // TableCell을 추가하여 정렬 보장
        verticalAlignment: TableCellVerticalAlignment.middle, // 세로 중앙 정렬
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Center(
            // 가로 중앙 정렬
            child: Text(
              title,
              textAlign: TextAlign.center, // 텍스트 자체도 중앙 정렬
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
      // Container(
      //   padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      //   child: Center(
      //     child: Text(
      //       title,
      //       style: TextStyle(
      //         fontSize: 16,
      //         fontWeight: FontWeight.w500,
      //       ),
      //     ),
      //   ),
      // ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Text(
          content,
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    ],
  );
}
