import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

appleCart() {
  return Container(
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                '장바구니',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF4D2E1C)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(Get.context!).size.height * 0.5,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                1,
                (index) {
                  return Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('data'),
                            Spacer(),
                            Column(
                              children: [
                                Text('data'),
                                Text('data'),
                              ],
                            ),
                            Spacer(),
                            Text('data'),
                          ],
                        ),
                      ),
                      Gap(10),
                      Row(
                        children: [
                          Text('data'),
                          Text('data'),
                        ],
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Row(
            children: const [
              Text('총 00개'),
              Gap(5),
              Text('10,000원  +  배송비 0원'),
              Spacer(),
              Text('10,000원')
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white,
                    border: Border.all(width: 1, color: Color(0xFF856655)),
                  ),
                  child: Center(
                    child: Text(
                      '선택상품 주문',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF4D2E1C),
                      ),
                    ),
                  ),
                ),
              ),
              Gap(15),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFF856655),
                  ),
                  child: Center(
                    child: Text(
                      '전체상품 주문',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
