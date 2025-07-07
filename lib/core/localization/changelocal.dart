import 'package:granddelivery/core/constant/apptheme.dart';
import 'package:granddelivery/core/functions/fcmconfig.dart';
import 'package:granddelivery/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeEnglish;

  changeLang(String langCode) {
    Locale locale = Locale(langCode);
    myServices.sharedPreferences.setString("lang", langCode);
    appTheme = langCode == "ar" ? themeArabic : themeEnglish;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  requestPerLocation() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Get.snackbar("Warning", "Please turn on the location service");
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Get.snackbar(
            "Warning", "Please give location permission to the application");
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Get.snackbar("Warning",
          "The application cannot be used without the location servicen");
    }
  }

  @override
  void onInit() {
    requestPermissionNotification();
    fcmConfig();
    requestPerLocation();
    String? sharedPerfLang = myServices.sharedPreferences.getString("lang");
    if (sharedPerfLang == "ar") {
      language = const Locale("ar");
      appTheme = themeArabic;
    } else if (sharedPerfLang == "en") {
      language = const Locale("en");
      appTheme = themeEnglish;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeEnglish;
    }
    super.onInit();
  }
}
