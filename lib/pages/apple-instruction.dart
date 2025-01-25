import 'package:apple_highland/global/g_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:gap/gap.dart';

import 'package:apple_highland/controllers/apple-home-page-controller.dart';
import 'package:get/get.dart';

AhomePageController controller = Get.put(AhomePageController());

appleInstruction() {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                '오시는 길',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4D2E1C)),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            height: 250,
            child: NaverMap(
              options: NaverMapViewOptions(
                initialCameraPosition: NCameraPosition(
                    target: NLatLng(38.264076, 128.150175), zoom: 12),
                scrollGesturesEnable: true, // 스크롤 제스처
                zoomGesturesEnable: true, // 줌 제스처
                rotationGesturesEnable: true, // 회전 제스처
                tiltGesturesEnable: true, // 기울기 제스처
                stopGesturesEnable: true, // 제스처 중지
                logoClickEnable: false,
                maxZoom: 20, // 최대 줌 레벨
                minZoom: 5,
              ),
              onMapReady: (NaverMapController controller) {
                controller.addOverlay(
                  NMarker(
                    id: 'marker1',
                    position: NLatLng(38.264076, 128.150175),
                  ),
                );
              },
            ),
          ),
        ),
        Gap(30),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              '애플하이랜드 과수원',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF856655)),
            ),
          ),
        ),
        Gap(40),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            children: const [
              Expanded(
                  flex: 3,
                  child: Text(
                    '주소',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF343434)),
                  )),
              Expanded(
                  flex: 7,
                  child: Text(
                    '강원도 양구군 해안면 만대리 2397',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF646464)),
                  )),
            ],
          ),
        ),
        Gap(20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            children: const [
              Expanded(
                  flex: 3,
                  child: Text(
                    '전화',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF343434)),
                  )),
              Expanded(
                  flex: 7,
                  child: Text(
                    '010-3522-6848',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF646464)),
                  )),
            ],
          ),
        ),
        Gap(20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Expanded(
                  flex: 3,
                  child: Text(
                    '이용시간',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF343434)),
                  )),
              Expanded(
                  flex: 7,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '평일 오전 09:00 ~ 오후 18:00',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF646464)),
                      ),
                      Gap(10),
                      Text(
                        '주말 오전 09:00 ~ 오후 18:00',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF646464)),
                      ),
                      Gap(10),
                      Text(
                        '공휴일 휴무',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF646464)),
                      ),
                    ],
                  )),
            ],
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
    ),
  );
}
