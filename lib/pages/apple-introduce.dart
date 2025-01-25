import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apple_highland/controllers/apple-home-page-controller.dart';
import 'package:gap/gap.dart';

AhomePageController controller = Get.put(AhomePageController());

appleIntroduce() {
  return Column(
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
                    child: Opacity(
                      opacity: index == controller.productIntroduceIndex.value
                          ? 1
                          : 0.5,
                      child: Image.asset(
                        controller.productIntroduceList[index]['image_path'],
                      ),
                    ),
                  ),
                  Gap(10),
                  Opacity(
                    opacity: index == controller.productIntroduceIndex.value
                        ? 1
                        : 0.5,
                    child: Text(
                      controller.productIntroduceList[index]['name'],
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF30180B)),
                    ),
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
      ),
      Gap(50),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            Expanded(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Divider(
                    color: Colors.grey[300],
                    thickness: 1,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    color: Colors.white,
                    child: Text(
                      '추가정보',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Gap(20),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFEDED),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/apple.png',
                width: 30,
                height: 30,
              ),
              Text('보관 팁'),
              Gap(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  height: 1,
                  color: Color(0xFFFFC9C9), // Divider 색상 변경
                ),
              ),
              Gap(20),
              Text('과일 간 공간을 확보하여 통풍 유지'),
              Gap(10),
              Text('냉장고 내부 온도를 0~4°C로 유지'),
              Gap(10),
              Text('에틸렌 가스를 방출하는 과일과 분리'),
            ],
          ),
        ),
      ),
      Gap(20),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFF9F5),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/sinagold.png',
                width: 30,
                height: 30,
              ),
              Text('출하시기'),
              Gap(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  height: 1,
                  color: Color(0xFFFFDCC5), // Divider 색상 변경
                ),
              ),
              Gap(20),
              Text('홍로와 감홍은 초가을부터 판매'),
              Gap(10),
              Text('시나골드와 부사는 늦가을 ~ 초가을까지 출하'),
            ],
          ),
        ),
      ),
      Gap(20),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFEDED),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/apple.png',
                width: 30,
                height: 30,
              ),
              Text('특징 차이'),
              Gap(20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  height: 1,
                  color: Color(0xFFFFC9C9), // Divider 색상 변경
                ),
              ),
              Gap(20),
              Text('홍로와 감홍은 풍미가 강하며 당도가 높은 편'),
              Gap(10),
              Text('시나골드는 산미와 단맛의 균형이 좋아'),
              Gap(10),
              Text('다양한 입맛에 적합'),
              Gap(20),
              Text('부사는 장기 보관이 가능하고'),
              Gap(10),
              Text('단단한 과육으로 신선도 유지가 용이'),
            ],
          ),
        ),
      ),
      Gap(50),
      SizedBox(
        width: double.infinity,
        height: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'assets/images/apple_image3.png',
                width: 100,
                height: 100,
              ),
            ),
            Gap(10),
            Text(
              '회사명:애플 하이랜드 / 대표자: 박현수',
              style: TextStyle(fontSize: 11, color: Color(0xFF646464)),
            ),
            Text(
              '주소: 강원도 양구군 해안면 만대리 2397 / 대표전화: 010-3522-6848',
              style: TextStyle(fontSize: 11, color: Color(0xFF646464)),
            ),
            Text(
              '사업자등록번호: 369-95-01729',
              style: TextStyle(fontSize: 11, color: Color(0xFF646464)),
            ),
            Text(
              'Copyright 애플하이랜드. All Rights Reserved.',
              style: TextStyle(fontSize: 11, color: Color(0xFF646464)),
            ),
          ],
        ),
      ),
      Gap(30)
    ],
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
