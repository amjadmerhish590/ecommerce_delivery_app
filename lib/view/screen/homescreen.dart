import 'dart:io';

import 'package:granddelivery/controller/homescreen_controller.dart';
import 'package:granddelivery/core/constant/color.dart';
import 'package:granddelivery/core/constant/routes.dart';
import 'package:granddelivery/view/widget/home/custombottomappbarhome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => Scaffold(
          appBar: AppBar(title: const Text("Orders"),
            leading: IconButton(onPressed: (){
              Get.defaultDialog(title: "Warning", middleText: "Are you sure you're logout?", onCancel: (){}, onConfirm: (){
                controller.logout();
                Get.back();
              });
          }, icon: Icon(Icons.exit_to_app)),),
              // drawer: Drawer(child: Text(""),),
              bottomNavigationBar: const CustomBottomAppBarHome(),
              body: WillPopScope(
                  child: controller.listPage.elementAt(controller.currentPage),
                  onWillPop: () {
                    Get.defaultDialog(
                      title: "Warning",
                      titleStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColor.primaryColor),
                      middleText: "Do You Want to Exit The App",
                      onConfirm: () {
                        exit(0);
                      },
                      onCancel: () {},
                      cancelTextColor: AppColor.secondColor,
                      confirmTextColor: AppColor.secondColor,
                      buttonColor: AppColor.thirdColor,
                    );
                    return Future.value(false);
                  }),
            ));
  }
}
