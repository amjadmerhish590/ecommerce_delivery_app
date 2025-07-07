import 'package:granddelivery/controller/forgetpassword/forgetpassword_controller.dart';
import 'package:granddelivery/core/class/handlingdataview.dart';
import 'package:granddelivery/core/constant/color.dart';
import 'package:granddelivery/core/functions/validinput.dart';
import 'package:granddelivery/view/widget/auth/custombuttonauth.dart';
import 'package:granddelivery/view/widget/auth/customtextbodyauth.dart';
import 'package:granddelivery/view/widget/auth/customtextformauth.dart';
import 'package:granddelivery/view/widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.backgroundColor,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Forget Password",
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: AppColor.grey),
          ),
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
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
                            text: "Check Email",
                          ),
                          const SizedBox(height: 10),
                          const CustomTextBodyAuth(
                            text:
                                "Please Enter Your Email Address To Recive A verification code",
                          ),
                          const SizedBox(height: 20),
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
                          CustomButtonAuth(
                              text: "Check",
                              onPressed: () {
                                controller.checkEmail();
                              }),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                )));
  }
}
