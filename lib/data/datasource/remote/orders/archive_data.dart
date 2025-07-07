import 'package:granddelivery/core/class/crud.dart';
import 'package:granddelivery/linkapi.dart';

class OrdersArchiveData {
  Crud crud;
  OrdersArchiveData(this.crud);

  getData(String deliveryId) async {
    var response = await crud.postData(AppLink.viewArchiveOrders, {
      "id": deliveryId,
    });
    return response.fold((l) => l, (r) => r);
  }

}
