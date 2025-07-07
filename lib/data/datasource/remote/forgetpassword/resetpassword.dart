import 'package:granddelivery/core/class/crud.dart';
import 'package:granddelivery/linkapi.dart';

class ResetPasswordData {
  Crud crud;
  ResetPasswordData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(AppLink.resetPasswordDelivery, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
