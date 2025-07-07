import 'package:granddelivery/core/services/services.dart';
import 'package:get/get.dart';

translateDatabase(columnAr, columnEn) {
  MyServices myServices = Get.find();
  if (myServices.sharedPreferences.getString("lang") == "ar") {
    return columnAr;
  } else {
    return columnEn;
  }
}
