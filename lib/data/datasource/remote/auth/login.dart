import 'package:granddelivery/core/class/crud.dart';
import 'package:granddelivery/linkapi.dart';

class LoginData {
  Crud crud;
  LoginData(this.crud);

  postData(String email, String password) async {
    var response = await crud.postData(AppLink.loginDelivery, {
      "email": email,
      "password": password,
    });
    return response.fold((l) => l, (r) => r);
  }
}
