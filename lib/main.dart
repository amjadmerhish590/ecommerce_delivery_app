import 'package:granddelivery/bindings/initialbindings.dart';
import 'package:granddelivery/core/localization/changelocal.dart';
import 'package:granddelivery/core/localization/translation.dart';
import 'package:granddelivery/core/services/services.dart';
import 'package:granddelivery/routes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: controller.appTheme,
      initialBinding: InitialBindings(),

      // routes: routes,
      getPages: routes,
    );
  }
}
