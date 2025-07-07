import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<MyServices> init() async {
    Platform.isAndroid
        ? await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "YOUR_API_KEY", // 🔐 Replace with your actual Firebase API key
        appId: "YOUR_APP_ID", // 📱 Firebase App ID for Android
        messagingSenderId: "YOUR_MESSAGING_SENDER_ID", // 💬 Firebase Cloud Messaging sender ID
        projectId: "YOUR_PROJECT_ID", // 📁 Firebase project ID
      ),
    )
        : await Firebase.initializeApp(); // iOS setup handled by GoogleService-Info.plist
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
