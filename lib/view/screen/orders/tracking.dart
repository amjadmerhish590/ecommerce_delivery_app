// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:granddelivery/controller/tracking_controller.dart';
import 'package:granddelivery/core/class/handlingdataview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:granddelivery/core/constant/color.dart';
import 'package:granddelivery/core/shared/custombutton.dart';

class OrdersTracking extends StatelessWidget {
  const OrdersTracking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TrackingController controller = Get.put(TrackingController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders Tracking"),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GetBuilder<TrackingController>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: Column(
                  children: [
                       Expanded(
                         child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            width: double.infinity,
                            child: GoogleMap(
                              polylines: controller.polylineSet,
                              mapType: MapType.normal,
                              markers: controller.markers.toSet(),
                              initialCameraPosition:
                              controller.cameraPosition!,
                              onMapCreated:
                                  (GoogleMapController controllerMap) {
                                controller.gmc = controllerMap;
                              },
                            ),
                          ),
                       ),
                    Container(
                      height: 40,
                      child: MaterialButton(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        minWidth: 300,
                        color: AppColor.primaryColor,
                        textColor: Colors.white,
                        onPressed: (){
                          controller.doneDelivery();
                        }, child: Text("The Order Has Been Delivered"),),
                    )

                  ],
                ),
              ))),
    );
  }
}
