import 'package:granddelivery/core/class/statusrequest.dart';
import 'package:granddelivery/core/constant/routes.dart';
import 'package:granddelivery/core/functions/handlingdatacontroller.dart';
import 'package:granddelivery/core/services/services.dart';
import 'package:granddelivery/data/datasource/remote/home_data.dart';
import 'package:granddelivery/data/model/itemsmodel.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
  goToItems(List categories, int selectedCat, String categoryId);
}

class HomeContrllerImp extends SearchMixController {
  MyServices myServices = Get.find();
  HomeData homeData = HomeData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  // List data = [];
  List categories = [];
  List items = [];
  List settingsData = [];

  String? username;
  String? id;
  String? lang;

  String titleHomeCard = "";
  String bodyHomeCard = "";
  String deliveryTime = "";

  @override
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    username = myServices.sharedPreferences.getString("username");
    id = myServices.sharedPreferences.getString("id");
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();
    print("+++++++++++++++++++++++++++++++++++++ Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        categories.addAll(response['categories']['data']);
        items.addAll(response['items']['data']);
        settingsData.addAll(response['settings']['data']);

        titleHomeCard = settingsData[0]['settings_titlehome'];
        bodyHomeCard = settingsData[0]['settings_bodyhome'];
        deliveryTime = settingsData[0]['settings_deliverytime'].toString();
        myServices.sharedPreferences.setString("deliveryTime", deliveryTime);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  // @override
  // goToItems(categories, selectedCat, categoryId) {
  //   Get.toNamed(AppRoute.items, arguments: {
  //     "categories": categories,
  //     "selectedCat": selectedCat,
  //     "categoryId": categoryId,
  //   });
  // }

  // goToPageProductDetails(itemsModel) {
  //   Get.toNamed(AppRoute.productdetails, arguments: {"itemsmodel": itemsModel});
  // }

  @override
  void onInit() {
    search = TextEditingController();
    // FirebaseMessaging.instance.subscribeToTopic('users').then((value) {
    //   print("Subscribed to topic users");
    // }).catchError((error) {
    //   print("Subscription error: $error");
    // });
    // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    //   print('Received message in foreground: ${message.notification?.title}');
    //   print(
    //       '*****************************Message body: ${message.notification?.body}');
    // });

    getData();
    initialData();
    super.onInit();
  }
}

class SearchMixController extends GetxController {
  TextEditingController? search;
  bool isSearch = false;
  StatusRequest statusRequest = StatusRequest.none;
  HomeData homeData = HomeData(Get.find());
  List<ItemsModel> listData = [];

  checkSearch(val) {
    if (val == "") {
      statusRequest = StatusRequest.none;
      isSearch = false;
    }
    update();
  }

  onSearchItems() {
    isSearch = true;
    searchData();
    update();
  }

  searchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.SeaechData(search!.text);
    print("+++++++++++++++++++++++++++++++++++++ Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        listData.clear();
        List responseData = response['data'];
        listData.addAll(responseData.map((e) => ItemsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
