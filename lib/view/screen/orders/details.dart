// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:granddelivery/controller/orders/details_controller.dart';
import 'package:granddelivery/core/class/handlingdataview.dart';
import 'package:granddelivery/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:granddelivery/core/constant/routes.dart';
import 'package:granddelivery/core/shared/custombutton.dart';

class OrdersDetails extends StatelessWidget {
  const OrdersDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrdersDetailsController controller = Get.put(OrdersDetailsController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Orders Details"),
      ),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: GetBuilder<OrdersDetailsController>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: ListView(
                      children: [
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Column(
                              children: [
                                Table(
                                  children: [
                                    TableRow(children: [
                                      Text(
                                        "Item",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: AppColor.primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "QTY",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: AppColor.primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "Price",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: AppColor.primaryColor,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ]),
                                    // TableRow(children: [
                                    //   Text("MacBook m1",
                                    //       textAlign: TextAlign.center),
                                    //   Text("2", textAlign: TextAlign.center),
                                    //   Text("1200", textAlign: TextAlign.center),
                                    // ]),
                                    ...List.generate(
                                      controller.data.length,
                                      (index) => TableRow(children: [
                                        Text(
                                            "${controller.data[index].itemsName}",
                                            textAlign: TextAlign.center),
                                        Text(
                                            "${controller.data[index].countitems}",
                                            textAlign: TextAlign.center),
                                        Text(
                                            "${controller.data[index].itemsprice}",
                                            textAlign: TextAlign.center),
                                      ]),
                                    )
                                  ],
                                ),
                                SizedBox(height: 10),
                                Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      "Total Price : ${controller.ordersModel.ordersTotalprice} S.P",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: AppColor.primaryColor,
                                          fontWeight: FontWeight.bold),
                                    )),
                              ],
                            ),
                          ),
                        ),
                        if (controller.ordersModel.ordersType == 0)
                          Card(
                            child: Container(
                              child: ListTile(
                                title: const Text(
                                  "Shipping Address",
                                  style: TextStyle(
                                      color: AppColor.primaryColor,
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(
                                    "${controller.ordersModel.addressCity} ${controller.ordersModel.addressStreet}"),
                              ),
                            ),
                          ),
                        if (controller.ordersModel.ordersType == 0)
                          Card(
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              height: 300,
                              width: double.infinity,
                              child: GoogleMap(
                                mapType: MapType.normal,
                                markers: controller.markers.toSet(),
                                initialCameraPosition:
                                    controller.cameraPosition!,
                                onMapCreated:
                                    (GoogleMapController controllerMap) {
                                  controller.completerController
                                      .complete(controllerMap);
                                },
                              ),
                            ),
                          ),
                        SizedBox(height: 10,),
                        if (controller.ordersModel.ordersType == 0 && controller.ordersModel.ordersStatus == 3)
                          CustomButton(text: "Tracking", onPressed: (){
                            Get.toNamed(AppRoute.tracking, arguments: {
                              "ordersmodel": controller.ordersModel
                            });
                          },),
                      ],
                    ),
                  ))),
    );
  }
}
