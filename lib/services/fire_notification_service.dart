import 'dart:io' as plat;
import 'package:firebase_messaging/firebase_messaging.dart';

class FireNotificationService {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  ///ios permission
  Future<void> init() async {
    // LocalNotificationService.initializze();
    if (plat.Platform.isIOS) {
      await firebaseMessaging.requestPermission();
    }

    await firebaseMessaging.setForegroundNotificationPresentationOptions(
      sound: true,
      alert: true,
      badge: true,
    );
    GetFireBaseToken();
  }

  Future<String?> GetFireBaseToken() async{
    var token = await firebaseMessaging.getToken();
    print("firebase token: $token");
  }


}