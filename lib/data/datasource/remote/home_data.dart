import 'package:granddelivery/core/class/crud.dart';
import 'package:granddelivery/linkapi.dart';

class HomeData {
  Crud crud;
  HomeData(this.crud);

  getData() async {
    var response = await crud.postData(AppLink.homepage, {});
    return response.fold((l) => l, (r) => r);
  }

  SeaechData(String search) async {
    var response = await crud.postData(AppLink.searchItems, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
