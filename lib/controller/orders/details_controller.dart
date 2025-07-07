import 'dart:async';

import 'package:granddelivery/core/class/statusrequest.dart';
import 'package:granddelivery/core/functions/handlingdatacontroller.dart';
import 'package:granddelivery/data/datasource/remote/orders/details_data.dart';
import 'package:granddelivery/data/model/ordersdetailsmodel.dart';
import 'package:granddelivery/data/model/ordersmodel.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrdersDetailsController extends GetxController {
  late OrdersModel ordersModel;
// For google Map
  late Completer<GoogleMapController> completerController;

  List<Marker> markers = [];

  double? lat;
  double? long;

  CameraPosition? cameraPosition;
// For google Map

  OrdersDetailsData ordersDetailsData = OrdersDetailsData(Get.find());

  List<OrdersDetailsModel> data = [];

  late StatusRequest statusRequest;

  getData() async {
    statusRequest = StatusRequest.loading;
    var response =
        await ordersDetailsData.getData(ordersModel.ordersId.toString());
    print("+++++++++++++++++++++++++++++++++++++ Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List listData = response['data'];
        data.addAll(listData.map((e) => OrdersDetailsModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  initialData() {
    completerController = Completer<GoogleMapController>();
    if (ordersModel.ordersType == 0) {
      completerController = Completer<GoogleMapController>();
      cameraPosition = CameraPosition(
        target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
        zoom: 12.4746,
      );
      markers.add(Marker(
          markerId: MarkerId("1"),
          position: LatLng(ordersModel.addressLat!, ordersModel.addressLong!)));
    }
  }

  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    initialData();
    getData();
    super.onInit();
  }
}
