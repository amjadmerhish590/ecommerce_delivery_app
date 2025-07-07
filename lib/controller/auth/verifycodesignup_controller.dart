import 'package:granddelivery/core/class/statusrequest.dart';
import 'package:granddelivery/core/constant/routes.dart';
import 'package:granddelivery/core/functions/handlingdatacontroller.dart';
import 'package:granddelivery/data/datasource/remote/auth/verifycodesignup.dart';
import 'package:get/get.dart';

abstract class VerifyCodeSignUpController extends GetxController {
  checkCode();
  goToSuccessSignUp(String verifyCodeSignUp);
  reSend();
}

class VerifyCodeSignUpControllerImp extends VerifyCodeSignUpController {
  VerifycodeSignUpData verifycodeSignUpData = VerifycodeSignUpData(Get.find());

  String? email;
  StatusRequest statusRequest = StatusRequest.none;

  @override
  checkCode() {}

  @override
  goToSuccessSignUp(verifyCodeSignUp) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await verifycodeSignUpData.postData(email!, verifyCodeSignUp);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.offAllNamed(AppRoute.successSignUp);
      } else {
        Get.defaultDialog(
            title: "Warning", middleText: "Verify Code Not Correct");
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
@override
  reSend() {
    verifycodeSignUpData.reSendData(email!);
  }

  @override
  void onInit() {
    email = Get.arguments['email'];
    super.onInit();
  }
}
