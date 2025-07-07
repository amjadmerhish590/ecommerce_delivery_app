import 'package:cached_network_image/cached_network_image.dart';
import 'package:granddelivery/controller/home_controller.dart';
import 'package:granddelivery/core/class/handlingdataview.dart';
import 'package:granddelivery/core/constant/routes.dart';
import 'package:granddelivery/data/model/itemsmodel.dart';
import 'package:granddelivery/linkapi.dart';
// import 'package:granddelivery/view/widget/customappbar.dart';
// import 'package:granddelivery/view/widget/home/customcardhome.dart';
// import 'package:granddelivery/view/widget/home/customtitlehome.dart';
// import 'package:granddelivery/view/widget/home/listcategorieshome.dart';
// import 'package:granddelivery/view/widget/home/listitemshome.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeContrllerImp controller = Get.put(HomeContrllerImp());
    return GetBuilder<HomeContrllerImp>(
        builder: (controller) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              children: [


              ],
            )));
  }
}


