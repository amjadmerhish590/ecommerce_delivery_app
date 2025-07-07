import 'package:granddelivery/core/class/crud.dart';
import 'package:granddelivery/linkapi.dart';

class VerifyCodeForgetPasswordData {
  Crud crud;
  VerifyCodeForgetPasswordData(this.crud);

  postData(String email, String verifycode) async {
    var response =
        await crud.postData(AppLink.verifyCodeForgetPasswordDelivery, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
