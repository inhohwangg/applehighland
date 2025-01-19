import 'dart:developer';

import 'package:apple_highland/global/g_dialog.dart';
import 'package:apple_highland/global/g_print.dart';
import 'package:apple_highland/main.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:kpostal/kpostal.dart';

import '../global/g_dio.dart';

class AppleLoginPageController extends GetxController {
  // 로그인 TextEditingController
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // 회원가입 TextEditingController
  TextEditingController registerEmail = TextEditingController();
  TextEditingController registerPassword = TextEditingController();
  TextEditingController registerPasswordCheck = TextEditingController();
  TextEditingController registerUserName = TextEditingController();
  TextEditingController registerPhoneNumber = TextEditingController();
  TextEditingController registerAddress = TextEditingController();
  TextEditingController registerAddressDetail = TextEditingController();
  TextEditingController registerZipCode = TextEditingController();

  RxBool emailCheck = false.obs;

  RxBool passwordVisibility = true.obs;
  RxBool passwordConfirmVisibility = true.obs;
  RxBool isPasswordCheck = true.obs;

  RxBool receiveEvent = false.obs;
  RxString registerGender = ''.obs;
  RxBool isValidPhone = true.obs;

  RxBool isVisibility = true.obs;

  Future<void> searchAddress() async {
    printCyan('test');
    await Navigator.push(
      Get.context!,
      MaterialPageRoute(
        builder: (_) => KpostalView(
          callback: (Kpostal result) {
            registerZipCode.text = result.postCode;
            registerAddress.text = result.address;
            registerAddressDetail.clear();
          },
        ),
      ),
    );
  }

  void formatPhoneNumber(String value) {
    // 숫자만 추출
    String numbers = value.replaceAll(RegExp(r'[^0-9]'), '');

    if (numbers.length > 11) {
      numbers = numbers.substring(0, 11);
    }

    String formatted = '';

    if (numbers.length >= 3) {
      formatted += numbers.substring(0, 3);
      if (numbers.length >= 7) {
        formatted += '-${numbers.substring(3, 7)}';
        if (numbers.length >= 8) {
          formatted += '-${numbers.substring(7)}';
        }
      } else if (numbers.length > 3) {
        formatted += '-${numbers.substring(3)}';
      }
    } else {
      formatted = numbers;
    }

    // 전화번호 유효성 검사
    RegExp phoneRegex = RegExp(r'^010-?([0-9]{4})-?([0-9]{4})$');
    isValidPhone.value = phoneRegex.hasMatch(formatted);

    // 커서 위치 계산
    int cursorPosition = formatted.length;

    registerPhoneNumber.value = TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: cursorPosition),
    );
  }

  checkPassword() {
    isPasswordCheck.value = registerPassword.text == registerPasswordCheck.text;
    emailCheck.value = false;
  }

  userCreate() async {
    try {
      if (registerEmail.text.isEmpty) {
        CustomDialog.show(text: '이메일을 입력해주세요.', actionText: '닫기');
      } else if (registerPassword.text.isEmpty) {
        CustomDialog.show(text: '비밀번호를 입력해주세요.', actionText: '닫기');
      } else if (registerUserName.text.isEmpty) {
        CustomDialog.show(text: '이름을 입력해주세요.', actionText: '닫기');
      } else if (registerPhoneNumber.text.isEmpty) {
        CustomDialog.show(text: '전화번호를 입력해주세요.', actionText: '닫기');
      } else if (registerAddress.text.isEmpty) {
        CustomDialog.show(text: '주소를 입력해주세요.', actionText: '닫기');
      } else if (registerGender.value.isEmpty) {
        CustomDialog.show(text: '성별을 선택해주세요.', actionText: '닫기');
      } else {
        var res = await dio.post(
          '/users/create',
          data: {
            'email': registerEmail.text,
            'password': registerPassword.text,
            'userName': registerUserName.text,
            'phoneNumber': registerPhoneNumber.text,
            'receiveEvent': receiveEvent.value,
            'address': registerAddress.text,
            'gender': registerGender.value,
          },
        );

        if (res.statusCode! >= 200 && res.statusCode! <= 399) {
          CustomDialog.show(text: '회원가입 성공!', actionText: '닫기');
          Get.toNamed('/login');
        }
      }
    } catch (e, s) {
      printRed('회원가입 에러 메세지 : $e');
      printRed('회원가입 에러 코드 라인 : $s');
    }
  }

  userEmailCheck() async {
    var res = await dio.get('/users/checkEmail',
        queryParameters: {'email': registerEmail.text});

    if (res.statusCode! >= 200 && res.statusCode! <= 399) {
      CustomDialog.show(text: '사용 가능한 이메일 입니다. ', actionText: '닫기');
    }
  }

  login() async {
    try {
      var res = await dio.post(
        '/auth/login',
        data: {
          'email': email.text,
          'password': password.text,
        },
      );
      if (res.statusCode! >= 200 && res.statusCode! <= 399) {
        getStorage.remove('token');
        getStorage.write('email', email.text);
        getStorage.write('token', res.data['accessToken']);
        Get.toNamed('/home');
      } else {
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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    child: Center(
                      child: Icon(
                        Icons.error,
                        color: Color(0xFFFF8484),
                      ),
                    ),
                  ),
                  Gap(10),
                  SizedBox(
                    child: Center(
                      child: Text(
                        '로그인 실패',
                        style:
                            TextStyle(color: Color(0xFF343434), fontSize: 14),
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
                              horizontal: 35, vertical: 10),
                          child: Center(
                            child: Text(
                              '닫기',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
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
    } catch (e, s) {
      printRed('로그인 실패 에러 메세지 :$e');
      printRed('로그인 실패 에러 코드 라인 :$s');
    }
  }
}
