import 'package:granddelivery/core/class/crud.dart';
import 'package:granddelivery/linkapi.dart';

class OrdersAcceptedData {
  Crud crud;
  OrdersAcceptedData(this.crud);

  getData(String deliveryId) async {
    var response = await crud.postData(AppLink.viewAcceptedOrders, {
      "id": deliveryId,
    });
    return response.fold((l) => l, (r) => r);
  }

  doneDelivery(String ordersId, String usersId) async {
    var response = await crud.postData(AppLink.doneOrders, {
      "ordersid": ordersId,
      "usersid": usersId,
    });
    return response.fold((l) => l, (r) => r);
  }
  
}
