import 'package:granddelivery/controller/auth/verifycodesignup_controller.dart';
import 'package:granddelivery/core/class/handlingdataview.dart';
import 'package:granddelivery/core/constant/color.dart';
import 'package:granddelivery/view/widget/auth/customtextbodyauth.dart';
import 'package:granddelivery/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';

class VerifyCodeSignUP extends StatelessWidget {
  const VerifyCodeSignUP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Verification Code",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: GetBuilder<VerifyCodeSignUpControllerImp>(
            builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: ListView(
                      children: [
                        const CustomTextTitleAuth(
                          text: "Check Code",
                        ),
                        const SizedBox(height: 10),
                        CustomTextBodyAuth(
                          text:
                              "Please Enter The Digit Code Sent To ${controller.email}",
                        ),
                        const SizedBox(height: 20),
                        OtpTextField(
                          fieldWidth: 50.0,
                          borderRadius: BorderRadius.circular(20),

                          numberOfFields: 5,
                          borderColor: const Color(0xFF512DA8),
                          //set to true to show as box or false to show as dash
                          showFieldAsBox: true,
                          //runs when a code is typed in
                          onCodeChanged: (String code) {
                            //handle validation or checks here
                          },
                          //runs when every textfield is filled
                          onSubmit: (String verificationCode) {
                            controller.goToSuccessSignUp(verificationCode);
                          },
                        ),
                        const SizedBox(height: 30),
                        InkWell(
                          onTap: () {
                            controller.reSend();
                          },
                          child: Center(
                              child: Text(
                            "Resend verify code",
                            style: TextStyle(
                              color: AppColor.primaryColor,
                              fontSize: 20,
                            ),
                          )),
                        ),
                      ],
                    ),
                  ),
                )));
  }
}
