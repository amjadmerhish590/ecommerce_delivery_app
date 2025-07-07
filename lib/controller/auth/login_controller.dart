import 'package:granddelivery/core/class/statusrequest.dart';
import 'package:granddelivery/core/constant/routes.dart';
import 'package:granddelivery/core/functions/handlingdatacontroller.dart';
import 'package:granddelivery/core/services/services.dart';
import 'package:granddelivery/data/datasource/remote/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:googleapis_auth/auth_io.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:get/get.dart';

abstract class LoginController extends GetxController {
  login();
  // goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;

  bool isShowPassword = true;
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;
  LoginData loginData = LoginData(Get.find());
  List data = [];

  String? accessToken;

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      print("+++++++++++++++++++++++++++++++++++++ Controller $response");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          // data.addAll(response['data']);
          if (response['data']['delivery_approve'] == 1) {
            myServices.sharedPreferences
                .setString("id", response['data']['delivery_id'].toString());
            String deliveryid = myServices.sharedPreferences.getString("id")!;
            myServices.sharedPreferences
                .setString("username", response['data']['delivery_name']);
            myServices.sharedPreferences
                .setString("email", response['data']['delivery_email']);
            myServices.sharedPreferences
                .setString("phone", response['data']['delivery_phone'].toString());
            myServices.sharedPreferences.setString("step", "2");
            FirebaseMessaging.instance.subscribeToTopic('delivery');
            FirebaseMessaging.instance
                .subscribeToTopic('delivery${deliveryid}');

            Get.offAllNamed(AppRoute.homepage);
          } else {
            Get.toNamed(AppRoute.verifyCodeSignUp, arguments: {
              "email": email.text,
            });
          }
        } else {
          Get.defaultDialog(
              title: "Warning", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      print("Not Valid");
    }
  }

  @override
  // goToSignUp() {
  //   Get.offNamed(AppRoute.signUp); // for problem GlobalKey
  // }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }



  @override
  void onInit() {
    FirebaseMessaging.instance.getToken().then((value) {
      print("*********token******* ${value}");
      String? token = value;
    });

    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
