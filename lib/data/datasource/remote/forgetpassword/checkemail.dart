import 'package:granddelivery/core/class/crud.dart';
import 'package:granddelivery/linkapi.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData(this.crud);

  postData(String email) async {
    var response = await crud.postData(AppLink.checkEmailDelivery, {
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
