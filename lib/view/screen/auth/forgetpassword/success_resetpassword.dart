import 'package:granddelivery/controller/auth/successresetpassword_controller.dart';
import 'package:granddelivery/core/constant/color.dart';
import 'package:granddelivery/view/widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Success",
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: AppColor.grey),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Center(
              child: Icon(
                Icons.check_circle_outlined,
                size: 200,
                color: AppColor.primaryColor,
              ),
            ),
            Text("congratulations",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 30)),
            const Text("Password has been reset successfully"),
            const Spacer(),
            Container(
              width: double.infinity,
              child: CustomButtonAuth(
                  text: "Go To Login",
                  onPressed: () {
                    controller.goToPageLogin();
                  }),
            ),
            const SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}
