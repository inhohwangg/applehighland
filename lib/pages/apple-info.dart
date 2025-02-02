import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:apple_highland/controllers/apple-home-page-controller.dart';

AhomePageController controller = Get.put(AhomePageController());

appleInfo() {
  return Container(
    color: Colors.white,
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
          height: MediaQuery.of(Get.context!).size.height * 0.35,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/apple_image3.png'),
                Gap(10),
                Text(
                  '애플 하이랜드는',
                  style: TextStyle(fontSize: 14, color: Color(0xFF30180B)),
                ),
                Text(
                  '건강한 사과만을 제공합니다.',
                  style: TextStyle(fontSize: 14, color: Color(0xFF30180B)),
                ),
                Gap(10),
                Text(
                  '남다른 재배 방법을 이용한 사과 생산으로',
                  style: TextStyle(fontSize: 12, color: Color(0xFF4D2E1C)),
                ),
                Text(
                  '최소한의 방제로 건강한 사과 생산을 하기 위해 노력합니다.',
                  style: TextStyle(fontSize: 12, color: Color(0xFF4D2E1C)),
                ),
              ],
            ),
          ),
        ),
        Gap(40),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      "",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF271300),
                      ),
                    ),
                    Text(
                      "",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF271300),
                      ),
                    ),
                    Text(
                      "언제나 소비자에게",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "정직함을 약속합니다.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF271300),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Expanded(
                flex: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5), // 이미지 둥글게 만들기
                  child: Image.asset(
                    'assets/images/farm_info1.png',
                    // height: 150,
                    // width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
        ),
        Gap(10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                '강원도 양구 펀치볼 650고지 청정지역에서 잔류농약',
                style: TextStyle(color: Color(0xFF646464), fontSize: 12),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                '걱정 없이 껍질째 먹을 수 있는 건강한 안심 먹거리를',
                style: TextStyle(color: Color(0xFF646464), fontSize: 12),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                '위해 노력하는 착한 농부가 있습니다.',
                style: TextStyle(color: Color(0xFF646464), fontSize: 12),
              ),
            ],
          ),
        ),
        Gap(40),

        //* 두번째 사진
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5), // 이미지 둥글게 만들기
                  child: Image.asset(
                    'assets/images/farm_info2.png',
                    // height: 150,
                    // width: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Spacer(),
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                    Text(
                      "",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF271300),
                      ),
                    ),
                    Text(
                      "",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF271300),
                      ),
                    ),
                    Text(
                      "건강하고 안전한 사과",
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "생산에 노력합니다.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF271300),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Gap(10),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                '건강한 사과만을 위해 강원도 양구 펀치볼로 이주했습니다.',
                style: TextStyle(color: Color(0xFF646464), fontSize: 12),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                '병충해와 기후온난화에 보다 안전한 지역인 펀치볼은',
                style: TextStyle(color: Color(0xFF646464), fontSize: 12),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Text(
                '안전한 사과 생산에 최적지입니다.',
                style: TextStyle(color: Color(0xFF646464), fontSize: 12),
              ),
            ],
          ),
        ),
        Gap(50),
        SizedBox(
          width: MediaQuery.of(Get.context!).size.width * 0.7,
          child: Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFF271300),
          ),
        ),
        Gap(20),
        Center(
          child: Text(
            '애플 하이랜드의',
            style: TextStyle(fontSize: 14, color: Color(0xFF30180B)),
          ),
        ),
        Center(
          child: Text(
            '사과와 사과즙을 소개합니다.',
            style: TextStyle(fontSize: 14, color: Color(0xFF30180B)),
          ),
        ),
        Gap(20),
        SizedBox(
          width: MediaQuery.of(Get.context!).size.width * 0.7,
          child: Divider(
            height: 1,
            thickness: 1,
            color: Color(0xFF271300),
          ),
        ),
        Gap(40),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50), // 이미지 둥글게 만들기
                  child: Image.asset(
                    'assets/images/product_info1.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Gap(10),
                Text(
                  '감홍',
                  style: TextStyle(fontSize: 12, color: Color(0xFF30180B)),
                ),
              ],
            ),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50), // 이미지 둥글게 만들기
                  child: Image.asset(
                    'assets/images/product_info2.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Gap(10),
                Text('시나골드',
                    style: TextStyle(fontSize: 12, color: Color(0xFF30180B))),
              ],
            ),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50), // 이미지 둥글게 만들기
                  child: Image.asset(
                    'assets/images/product_info3.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Gap(10),
                Text('부사',
                    style: TextStyle(fontSize: 12, color: Color(0xFF30180B))),
              ],
            ),
          ],
        ),
        Gap(30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50), // 이미지 둥글게 만들기
                  child: Image.asset(
                    'assets/images/product_info4.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Gap(10),
                Text('아리수 / 홍로',
                    style: TextStyle(fontSize: 12, color: Color(0xFF30180B))),
              ],
            ),
            Gap(50),
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(50), // 이미지 둥글게 만들기
                  child: Image.asset(
                    'assets/images/product_info5.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Gap(10),
                Text('사과즙',
                    style: TextStyle(fontSize: 12, color: Color(0xFF30180B))),
              ],
            ),
          ],
        ),
        Gap(50),
        //! CarouselSlider 로 변경해야함
        CarouselSlider.builder(
          itemCount: controller.farmInfoList.length,
          itemBuilder: (context, index, realIndex) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5), // 이미지 둥글게 만들기
                    child: Image.asset(
                      width: MediaQuery.of(Get.context!).size.width * 0.8,
                      height: MediaQuery.of(Get.context!).size.height * 0.3,
                      'assets/images/${controller.farmInfoList[index]}',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.6)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '"${controller.farmInfoTextList1[index]}"',
                              style: TextStyle(
                                color: Color(0xFFFFFDD7),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Gap(10),
                            Text(
                              '${controller.farmInfoTextList2[index]}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            // Gap(10),
                            Text(
                              '${controller.farmInfoTextList3[index]}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
          options: CarouselOptions(
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            aspectRatio: 16 / 9,
            viewportFraction: 1.0,
            enlargeFactor: 0.3,
            onPageChanged: (index, reason) {
              controller.carouselIndex1.value = index;
            },
          ),
        ),
        Gap(10),
        Obx(
          () => DotsIndicator(
            position: controller.carouselIndex1.value,
            dotsCount: controller.farmInfoList.length,
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              color: Color(0xFFE7E7E7),
              activeSize: const Size(20.0, 9.0),
              activeColor: Color(0xFFB59888),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        ),
        Gap(75),
        Container(
          child: Center(
            child: Image.asset('assets/images/Frame 113.png'),
          ),
        ),
        Gap(30),
        Center(
            child: Text(
          '노력하는 부지런한 농부가 있는',
          style: TextStyle(fontSize: 14, color: Color(0xFF271300)),
        )),
        Center(
            child: Text(
          '애플 하이랜드의 사과를 맛보세요.',
          style: TextStyle(fontSize: 14, color: Color(0xFF271300)),
        )),
        Gap(75),
        Container(
          width: double.infinity,
          height: 200,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/paper.png',
                ),
                fit: BoxFit.cover,
                opacity: 0.7),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                '고객센터 안내',
                style: TextStyle(fontSize: 14, color: Color(0xFF30180B)),
              ),
              Gap(10),
              Text(
                '010 - 3522 - 6848',
                style: TextStyle(fontSize: 12, color: Color(0xFF646464)),
              ),
              Gap(10),
              Text(
                '평일  오전 9시 ~ 오후 6시',
                style: TextStyle(fontSize: 12, color: Color(0xFF646464)),
              ),
              Text(
                '주말  오전 9시 ~ 오후 6시',
                style: TextStyle(fontSize: 12, color: Color(0xFF646464)),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 1,
                  height: 1,
                  color: Color(0xFFD9D9D9),
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 125,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/paper.png',
                ),
                fit: BoxFit.cover,
                opacity: 0.7),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Text(
                '계좌',
                style: TextStyle(fontSize: 14, color: Color(0xFF30180B)),
              ),
              Gap(10),
              Text(
                '농협 352-1748-0007-33 박현수',
                style: TextStyle(fontSize: 12, color: Color(0xFF646464)),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(
                  thickness: 1,
                  height: 1,
                  color: Color(0xFFD9D9D9),
                ),
              )
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 125,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/paper.png',
                ),
                fit: BoxFit.cover,
                opacity: 0.7),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                '주소',
                style: TextStyle(fontSize: 14, color: Color(0xFF30180B)),
              ),
              Gap(10),
              Text(
                '강원도 양구군 해안면 만대리 2397',
                style: TextStyle(fontSize: 12, color: Color(0xFF646464)),
              ),
            ],
          ),
        ),
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
    ),
  );
}
