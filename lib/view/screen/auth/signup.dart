import 'package:granddelivery/controller/auth/signup_controller.dart';
import 'package:granddelivery/core/class/handlingdataview.dart';
import 'package:granddelivery/core/constant/color.dart';
import 'package:granddelivery/core/functions/alertexitapp.dart';
import 'package:granddelivery/core/functions/validinput.dart';
import 'package:granddelivery/view/widget/auth/custombuttonauth.dart';
import 'package:granddelivery/view/widget/auth/customtextbodyauth.dart';
import 'package:granddelivery/view/widget/auth/customtextformauth.dart';
import 'package:granddelivery/view/widget/auth/customtexttitleauth.dart';
import 'package:granddelivery/view/widget/auth/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Sign Up",
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: WillPopScope(
          onWillPop: alertExitApp,
          child: GetBuilder<SignUpControllerImp>(
              builder: (controller) => HandlingDataRequest(
                  statusRequest: controller.statusRequest,
                  widget: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                    child: Form(
                      key: controller.formstate,
                      child: ListView(
                        children: [
                          const CustomTextTitleAuth(
                            text: "Welcome Back",
                          ),
                          const SizedBox(height: 10),
                          const CustomTextBodyAuth(
                            text:
                                "Sign Up With Your Email And Password OR Continue With Social Media",
                          ),
                          const SizedBox(height: 20),
                          CustomTextFromAuth(
                            hinttext: "Enter Your Username",
                            iconData: Icons.person_outline,
                            labeltext: "Username",
                            myController: controller.username,
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 3, 20, "username");
                            },
                          ),
                          CustomTextFromAuth(
                            hinttext: "Enter Your Email",
                            iconData: Icons.email_outlined,
                            labeltext: "Email",
                            myController: controller.email,
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 3, 40, "email");
                            },
                          ),
                          CustomTextFromAuth(
                            hinttext: "Enter Your Phone",
                            iconData: Icons.phone_android_outlined,
                            labeltext: "Phone",
                            myController: controller.phone,
                            isNumber: true,
                            valid: (val) {
                              return validInput(val!, 7, 11, "phone");
                            },
                          ),
                          CustomTextFromAuth(
                            hinttext: "Enter Your Password",
                            iconData: Icons.lock_outlined,
                            labeltext: "Password",
                            myController: controller.password,
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 3, 30, "password");
                            },
                          ),
                          CustomButtonAuth(
                              text: "Sign Up",
                              onPressed: () {
                                controller.signUp();
                              }),
                          const SizedBox(height: 30),
                          CustomTextSignUpOrSignIn(
                              textOne: " Have an account ? ",
                              textTwo: " SignIn ",
                              onTap: () {
                                controller.goToSignIn();
                              }),
                        ],
                      ),
                    ),
                  )))),
    );
  }
}
