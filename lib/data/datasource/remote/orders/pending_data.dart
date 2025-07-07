import 'package:granddelivery/core/class/crud.dart';
import 'package:granddelivery/linkapi.dart';

class OrdersPendingData {
  Crud crud;
  OrdersPendingData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.viewPendingOrders, {});
    return response.fold((l) => l, (r) => r);
  }

  approveOrders(String deliveryId, String usersId, String ordersId) async {
    var response = await crud.postData(AppLink.approveOrders, {
      "deliveryid": deliveryId,
      "usersid": usersId,
      "ordersid": ordersId
    });
    return response.fold((l) => l, (r) => r);
  }

}
