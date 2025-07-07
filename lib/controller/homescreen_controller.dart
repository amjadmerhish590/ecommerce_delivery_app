import 'package:granddelivery/view/screen/home.dart';
// import 'package:granddelivery/view/screen/notification.dart';
// import 'package:granddelivery/view/screen/offers.dart';
// import 'package:granddelivery/view/screen/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:granddelivery/view/screen/orders/accepted.dart';
import 'package:granddelivery/view/screen/orders/archive.dart';
import 'package:granddelivery/view/screen/orders/pending.dart';
import 'package:granddelivery/core/constant/routes.dart';
import 'package:granddelivery/core/services/services.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
  logout();
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  MyServices myServices = Get.find();

  List<Widget> listPage = [
    const OrdersPending(),
    const OrdersAccepted(),
    const OrdersArchiveView(),

  ];

  List bottomAppBar = [
    {"title": "Pending", "icon": Icons.home},
    {"title": "Accepted", "icon": Icons.add_shopping_cart_outlined},
    {"title": "Archive", "icon": Icons.shopping_bag},
  ];

  @override
  changePage(int i) {
    currentPage = i;
    update();
  }
  @override
  logout() {
    String deliveryid = myServices.sharedPreferences.getString("id")!;
    FirebaseMessaging.instance.unsubscribeFromTopic('delivery');
    FirebaseMessaging.instance.unsubscribeFromTopic('delivery${deliveryid}');
    myServices.sharedPreferences.clear();
    Get.offAllNamed(AppRoute.login);
  }
}
