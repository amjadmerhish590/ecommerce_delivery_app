import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:granddelivery/controller/orders/accepted_controller.dart';
import 'package:granddelivery/core/class/statusrequest.dart';
import 'package:granddelivery/core/constant/routes.dart';
import 'package:granddelivery/core/functions/getdecodepolyline.dart';
import 'package:granddelivery/core/services/services.dart';
import 'package:granddelivery/data/model/ordersmodel.dart';

class TrackingController extends GetxController{


  GoogleMapController? gmc;
  List<Marker> markers = [];
  CameraPosition? cameraPosition;

  StatusRequest statusRequest = StatusRequest.success;
  late OrdersModel ordersModel;

  double? destLat;
  double? destLong;

  double? currentLat;
  double? currentLong;


  Set<Polyline> polylineSet = {};

  MyServices myServices = Get.find();

  Timer? timer;

  StreamSubscription<Position>? positionStream;

  OrdersAcceptedController ordersAcceptedController = Get.find();


  doneDelivery() async{
    statusRequest = StatusRequest.loading;
    update();
    await ordersAcceptedController.doneDelivery(ordersModel.ordersId.toString(), ordersModel.ordersUsersid.toString());
    Get.offAllNamed(AppRoute.homepage);
  }

  getCurrentLocation() {
    cameraPosition = CameraPosition(
      target: LatLng(ordersModel.addressLat!, ordersModel.addressLong!),
      zoom: 12.4746,
    );

    markers.add(Marker(
        markerId: MarkerId("Destination"),
        position: LatLng(ordersModel.addressLat!, ordersModel.addressLong!)));

    positionStream = Geolocator.getPositionStream().listen((Position? position) {
          print("============== Current Postion");
          currentLat = position!.latitude;
          currentLong = position.longitude;
          print(position.latitude);
          print(position.longitude);
          if(gmc != null){
            gmc!.animateCamera(CameraUpdate.newLatLng(LatLng(currentLat!, currentLong!)));
          }
          markers.removeWhere((element) => element.markerId.value == "Current");
          markers.add(Marker(
              markerId: MarkerId("Current"),
              position: LatLng(position.latitude, position.longitude)));

          update();
        });

  }

  refreshLocation() async{
    await Future.delayed(Duration(seconds: 2));
    timer = Timer.periodic(Duration(seconds: 10), (timer){
      FirebaseFirestore.instance.collection("delivery").doc(ordersModel.ordersId.toString()).set({
        "lat": currentLat,
        "long": currentLong,
        "deliveryid": myServices.sharedPreferences.getString("id")
      });
    });
  }

  initPolyline() async{
    destLat = double.parse(ordersModel.addressLat.toString());
    destLong = double.parse(ordersModel.addressLong.toString());
    await Future.delayed( Duration(seconds: 5));
    polylineSet = await getPolyline(currentLat, currentLong, destLat, destLong);
    update();
  }


  @override
  void onInit() {
    ordersModel = Get.arguments['ordersmodel'];
    getCurrentLocation();
    refreshLocation();
    initPolyline();
    super.onInit();
  }
  @override
  void onClose() {
    positionStream!.cancel();
    gmc!.dispose();
    timer!.cancel();
    super.onClose();
  }
}

// 1- get current postion
// 2- tracking