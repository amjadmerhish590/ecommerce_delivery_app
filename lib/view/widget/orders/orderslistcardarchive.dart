import 'package:granddelivery/controller/orders/archive_controller.dart';

import 'package:granddelivery/core/constant/color.dart';
import 'package:granddelivery/core/constant/routes.dart';
import 'package:granddelivery/data/model/ordersmodel.dart';
import 'package:granddelivery/view/widget/orders/dialograting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class CardOrdersListArchive extends GetView<OrdersArchiveController> {
  final OrdersModel listData;
  const CardOrdersListArchive({Key? key, required this.listData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Order Number : #${listData.ordersId}",
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                // Text(listData.ordersDatetime!),
                Text(
                  Jiffy.parse(listData.ordersDatetime!).fromNow(),
                  style: const TextStyle(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(),
            Text(
                "Order Type : ${controller.printOrderType(listData.ordersType.toString())}"),
            Text("Order Price : ${listData.ordersPrice} S.P"),
            Text("Phone Number : ${listData.ordersUsersphone}"),
            Text("Delivery Price : ${listData.ordersPricedelivery} S.P"),
            Text(
                "Payment Method : ${controller.printPaymentMethod(listData.ordersPaymentmethod.toString())}"),
            Text(
                "Order Status : ${controller.printOrderStatus(listData.ordersStatus.toString())}"),
            const Divider(),
            Row(
              children: [
                Text("Total Price : ${listData.ordersTotalprice} S.P",
                    style: const TextStyle(
                        color: AppColor.primaryColor,
                        fontWeight: FontWeight.bold)),
                const Spacer(),
                MaterialButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.ordersDetails,
                        arguments: {"ordersmodel": listData});
                  },
                  color: AppColor.thirdColor,
                  textColor: AppColor.fourthColor,
                  child: const Text("Details"),
                ),
                SizedBox(width: 10),
                // if (listData.ordersRating == 0)
                //   MaterialButton(
                //     onPressed: () {
                //       showDialogRating(context, listData.ordersId.toString());
                //     },
                //     color: AppColor.thirdColor,
                //     textColor: AppColor.fourthColor,
                //     child: const Text("Rating"),
                //   ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
