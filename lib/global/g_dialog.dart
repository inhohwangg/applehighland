import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

class CustomDialog {
  static void show({
    required String text,
    String actionText = '',
    Color? color,
    Icon? icon,
  }) {
    showDialog(
      context: Get.context!,
      builder: (context) {
        return AlertDialog(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                child: Center(
                  child: icon,
                ),
              ),
              Gap(10),
              SizedBox(
                child: Center(
                  child: Text(
                    text,
                    style: TextStyle(color: Color(0xFF343434), fontSize: 14),
                  ),
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
                        color: Color(0xFFF5F5F5),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 35,
                        vertical: 10
                      ),
                      child: Center(
                        child: Text(
                          actionText,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14
                          ),
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
  }
}
