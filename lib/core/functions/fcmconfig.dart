import 'package:granddelivery/controller/orders/pending_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

requestPermissionNotification() async {
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}
final player = AudioPlayer();

Future<void> playNotification() async {
  await player.play(AssetSource('sounds/notification.mp3'));
}

fcmConfig() {
  FirebaseMessaging.onMessage.listen((message) {
    print(
        "***************************** Notification ***************************");
    print(message.notification!.title);
    print(message.notification!.body);
    playNotification();
    // FlutterRingtonePlayer().playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshPageNotification(message.data);
  });
}

refreshPageNotification(data) {
  print("************************************* Page ID");
  print(data['pageid']);
  print("************************************* Page Name");
  print(data['pagename']);
  print("+++++++++++++++++++++++++++++++++++++++ Current Route");
  print(Get.currentRoute);

  if (Get.currentRoute == "/orderspending" &&
      data['pagename'] == "refreshorderpending") {
    OrdersPendingController controller = Get.find();
    controller.refreshOrder();
  }
}

//For Real Time
// Firebase + Stream
// Socket io
// Notification refresh
