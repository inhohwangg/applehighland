import 'package:apple_highland/controllers/apple-home-page-controller.dart';
import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

AhomePageController controller = Get.put(AhomePageController());

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
            children: [
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
                controller.cartList.length,
                (index) {
                  Map item = controller.cartList[index];
                  return Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Obx(() => SizedBox(
                                  width: 20, // 원하는 크기로 조절
                                  height: 20,
                                  child: Checkbox(
                                    value: controller.checkBoxValue.value,
                                    onChanged: (value) {
                                      controller.checkBoxValue.value = value!;
                                    },
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                  ),
                                )),
                            Gap(10),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child:
                                  Image.asset('assets/images/cart_image.png'),
                            ),
                            Gap(20),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '사과',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF343434).withOpacity(0.6),
                                  ),
                                ),
                                Gap(5),
                                Text(
                                  item['productName'],
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF343434)),
                                ),
                                Gap(5),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      color:
                                          Color(0xFFF2F2F2).withOpacity(0.5)),
                                  child: Text(
                                    '옵션 변경',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xFF343434)),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Icon(Icons.close),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Gap(25),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey[300]!,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              height: 32,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  // 마이너스 버튼
                                  InkWell(
                                    onTap: () {
                                      print('this -');
                                      // 수량 감소 로직
                                      controller.cartList[index]
                                          ['cartQuantity']--;
                                      controller.cartList.refresh();
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.remove,
                                        size: 16,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),

                                  // 수량 표시
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20),
                                    width: 50,
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: Colors.grey[300]!),
                                        right: BorderSide(
                                            color: Colors.grey[300]!),
                                      ),
                                    ),
                                    child: Obx(
                                      () => Text(
                                        controller.cartList[index]
                                                ['cartQuantity']
                                            .toString(),
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),

                                  // 플러스 버튼
                                  InkWell(
                                    onTap: () {
                                      print('this +');
                                      // 수량 증가 로직
                                      controller.cartList[index]
                                          ['cartQuantity']++;
                                      controller.cartList.refresh();
                                    },
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      alignment: Alignment.center,
                                      child: Icon(
                                        Icons.add,
                                        size: 16,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Text(
                              NumberFormat('#,###').format(
                                  item['cartQuantity'] * item['productPrice']),
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF343434),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(20),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          child: Obx(() {
            // 총 금액 계산
            int totalPrice = 0;
            for (var item in controller.cartList) {
              totalPrice +=
                  (item['cartQuantity'] * item['productPrice']) as int;
            }

            return Row(
              children: [
                Text('총 ${controller.cartList.length}개'),
                Gap(5),
                Text('${NumberFormat('#,###').format(totalPrice)}원  +  배송비 0원'),
                Spacer(),
                Text('${NumberFormat('#,###').format(totalPrice)}원')
              ],
            );
          }),
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
