import 'package:apple_highland/global/g_print.dart';
import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:gap/gap.dart';

import 'package:apple_highland/controllers/apple-home-page-controller.dart';
import 'package:get/get.dart';

AhomePageController controller = Get.put(AhomePageController());

appleInstruction() {
  return Container(
    height: MediaQuery.of(Get.context!).size.height * 1,
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
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            width: double.infinity,
            height: 250,
            child: NaverMap(
              options: NaverMapViewOptions(
                  initialCameraPosition: NCameraPosition(
                      target: NLatLng(38.264076, 128.150175), zoom: 15)),
              onMapReady: (controller) {
                printRed('네이버 맵 로딩');
              },
            ),
          ),
        )
      ],
    ),
  );
}
