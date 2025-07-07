import 'package:granddelivery/controller/homescreen_controller.dart';
import 'package:granddelivery/view/widget/home/custombuttonappbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomAppBarHome extends StatelessWidget {
  const CustomBottomAppBarHome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
        builder: (controller) => BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 10,
            child: Row(
              children: [
                ...List.generate(controller.listPage.length, ((index) {
                  return Expanded(child: CustomButtonAppBar(
                    textButton: controller.bottomAppBar[index]['title'],
                    iconData: controller.bottomAppBar[index]['icon'],
                    onPressed: () {
                      controller.changePage(index);
                    },
                    active: controller.currentPage == index ? true : false,
                  ),);
                })),
              ],
            )));
  }
}
