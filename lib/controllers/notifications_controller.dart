import 'package:fha/utils/services/notification_interface.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class NotificationsController extends GetxController {
  late NotificationInterface notificationInterface;
  late FirebaseMessaging _firebaseMessaging;

  @override
  void onInit() {
    _firebaseMessaging = FirebaseMessaging.instance;
    notificationInterface = NotificationInterface(_firebaseMessaging);
    notificationInterface.initialize();
    super.onInit();
  }
}
