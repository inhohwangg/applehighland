import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:apple_highland/controllers/apple-home-page-controller.dart';
import 'package:intl/intl.dart';

AhomePageController controller = Get.put(AhomePageController());

applePrice() {
  return Obx(
    () => Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    'assets/images/paper.png',
                  ),
                  fit: BoxFit.cover,
                  opacity: 0.7),
            ),
            width: double.infinity,
            height: MediaQuery.of(Get.context!).size.height * 0.2,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/Frame 113.png'),
                      Gap(20),
                      Text('사과')
                    ],
                  ),
                  Gap(20),
                  Text(
                    '"껍질에도 영양성분이 가득한 애플 하이랜드 사과"',
                    style: TextStyle(fontSize: 14, color: Color(0xFF30180B)),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            padding: EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 10),
            // height: MediaQuery.of(Get.context!).size.height * 0.15,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List<Widget>.generate(controller.category.length,
                    (int index) {
                  return RawChip(
                    label: SizedBox(
                      width: 50,
                      child: Text(
                        controller.category[index],
                        textAlign: TextAlign.center,
                      ),
                    ),
                    selected: controller.selectedCategoryIndex.value == index,
                    onSelected: (bool selected) {
                      controller.selectedCategoryIndex.value =
                          selected ? index : 0;
                    },
                    selectedColor: Color(0xFF8B5E3C), // 선택된 상태의 색상
                    backgroundColor: Colors.white, // 기본 배경색
                    labelStyle: TextStyle(
                        color: controller.selectedCategoryIndex.value == index
                            ? Colors.white
                            : Color(0xFF8B5E3C)), // 선택 여부에 따른 텍스트 색상
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                        color: controller.selectedCategoryIndex.value == index
                            ? Color(0xFF8B5E3C)
                            : Color(0xFFD9D9D9),
                      ),
                    ),
                    showCheckmark: false,
                  );
                }),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            width: double.infinity,
            height: MediaQuery.of(Get.context!).size.height * 0.05,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(controller.tabs.length * 2 - 1, (index) {
                if (index % 2 == 0) {
                  // 탭 텍스트
                  int tabIndex = index ~/ 2;
                  return GestureDetector(
                    onTap: () {
                      controller.selectedIndex.value = tabIndex;
                    },
                    child: Obx(() => Text(
                          controller.tabs[index ~/ 2],
                          style: TextStyle(
                            color: controller.selectedIndex.value == tabIndex
                                ? Color(0xFF856655)
                                : Color(0xFF856655).withOpacity(0.6),
                            fontWeight:
                                controller.selectedIndex.value == tabIndex
                                    ? FontWeight.bold // 선택된 탭만 굵게 표시
                                    : FontWeight.normal,
                          ),
                        )),
                  );
                } else {
                  // 구분자 |
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "|",
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }
              }),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            color: Colors.white,
            width: double.infinity,
            height: MediaQuery.of(Get.context!).size.height * 0.5,
            child: GridView.builder(
              itemCount: controller.appleProductsList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15),
              itemBuilder: (context, index) {
                Map item = controller.appleProductsList[index];
                return Center(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (controller.tabIndex.value == 3)
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: Get.context!,
                            builder: (context) {
                              return Dialog(
                                backgroundColor: Colors.transparent,
                                child: Container(
                                  width: 300,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Stack(
                                        children: [
                                          // 이미지를 상단 전체에 채우기
                                          ClipRRect(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(5)),
                                            child: SizedBox(
                                              height: 200,
                                              width: double.infinity,
                                              child: Image.network(
                                                '${dotenv.get('API')}/files/getFile?fileName=${item['productFiles']}',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          // 닫기 버튼
                                          Positioned(
                                            right: 10,
                                            top: 10,
                                            child: IconButton(
                                              icon: Icon(Icons.close,
                                                  color: Colors.white),
                                              onPressed: () =>
                                                  Navigator.pop(context),
                                            ),
                                          ),
                                        ],
                                      ),
                                      // 컨텐츠 영역...
                                      Gap(10),
                                      Text(
                                        item['productName'],
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Gap(10),
                                      Divider(
                                        color: Colors.grey[200],
                                      ),
                                      Gap(10),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          children: [
                                            Text('판매가'),
                                            Gap(40),
                                            Text(
                                              '${NumberFormat('#,###').format(item['productPrice'])}원',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Color(0xFFFF5A5A)),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Gap(10),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          children: const [
                                            Text('배송비'),
                                            Gap(40),
                                            Text('무료'),
                                          ],
                                        ),
                                      ),
                                      Gap(10),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Row(
                                          children: const [
                                            Text('수량량'),
                                            Gap(40),
                                            Text('무료'),
                                          ],
                                        ),
                                      ),
                                      Gap(10),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 10),
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Color(0xFF856655)),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(
                                                '장바구니',
                                                style: TextStyle(
                                                    color: Color(0xFF856655)),
                                              ),
                                            ),
                                            Gap(20),
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 10),
                                              decoration: BoxDecoration(
                                                  color: Color(0xFF856655),
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Text(
                                                '바로 구매',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: AspectRatio(
                            aspectRatio: 1.5 / 1,
                            child: Image.network(
                              '${dotenv.get('API')}/files/getFile?fileName=${item['productFiles']}',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    else if (controller.tabIndex.value == 2)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: AspectRatio(
                          aspectRatio: 1.5 / 1,
                          child: Image.asset(
                            'assets/images/product_info6.jpg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    Gap(10),
                    Text(
                      item['productName'],
                      style: TextStyle(fontSize: 12, color: Color(0xFF271300)),
                    ),
                    Text(
                      '${NumberFormat('#,###').format(item['productPrice'])}원',
                      style: TextStyle(fontSize: 14, color: Color(0xFFFF5A5A)),
                    ),
                  ],
                ));
              },
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/images/apple_image.png',
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
        ],
      ),
    ),
  );
}
