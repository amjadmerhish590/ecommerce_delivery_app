import 'package:granddelivery/core/class/crud.dart';
import 'package:granddelivery/linkapi.dart';

class VerifycodeSignUpData {
  Crud crud;
  VerifycodeSignUpData(this.crud);

  postData(String email, String verifyCode) async {
    var response = await crud.postData(AppLink.verifyCodeSignUpDelivery, {
      "email": email,
      "verifycode": verifyCode,
    });
    return response.fold((l) => l, (r) => r);
  }

  reSendData(String email) async {
    var response = await crud.postData(AppLink.reSendDelivery, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
