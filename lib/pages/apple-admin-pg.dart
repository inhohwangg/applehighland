import 'package:apple_highland/controllers/apple-admin-ctl-pg.dart';
import 'package:apple_highland/controllers/apple-home-page-controller.dart';
import 'package:apple_highland/utils/apple-animation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class AppleAdminPage extends GetView<AhomePageController> {
  AppleAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.grey[200]!.withOpacity(0.5),
                borderRadius: BorderRadius.circular(5)),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      Text(
                        '관리자 페이지',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
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
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
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
                                            color: Color(0xFF343434),
                                            fontSize: 14),
                                      ),
                                    ),
                                    Gap(20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
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
                                        Gap(15),
                                        GestureDetector(
                                          onTap: () {
                                            controller.logOut();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              color: Colors.blue[200],
                                            ),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 35, vertical: 10),
                                            child: Center(
                                              child: Text(
                                                '확인',
                                                style: TextStyle(
                                                    color: Colors.white,
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
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.red[200],
                            borderRadius: BorderRadius.circular(10),
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
                Divider(
                  color: Colors.grey[300],
                ),
                Gap(20),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 1.1),
                      itemCount: controller.adminMenuList.length,
                      itemBuilder: (context, index) {
                        return Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          child: Ink(
                            decoration: BoxDecoration(
                              color: Colors.blue[300]!.withOpacity(0.6),
                              // color: Color.fromARGB(255, 173, 202, 221),
                              // color: Color.fromARGB(255, 173, 202, 221),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {},
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Center(
                                    child: Text(
                                      controller.adminMenuList[index]['name'],
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                  Gap(20),
                                  Obx(
                                    () => AnimatedBorderContainer(
                                      shouldAnimate: controller
                                              .adminMenuList[index]['count'] >
                                          0,
                                      child: controller.isAdmingLoading.value
                                          ? Text(
                                              '${controller.adminMenuList[index]['count']} 건',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w400),
                                            )
                                          : SizedBox(
                                              width: 20,
                                              height: 20,
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
