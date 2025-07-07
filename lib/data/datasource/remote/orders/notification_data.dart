import 'package:granddelivery/core/class/crud.dart';
import 'package:granddelivery/linkapi.dart';

class NotificationData {
  Crud crud;
  NotificationData(this.crud);

  getData(String id) async {
    var response = await crud.postData(AppLink.notification, {"usersid": id});
    return response.fold((l) => l, (r) => r);
  }
}
