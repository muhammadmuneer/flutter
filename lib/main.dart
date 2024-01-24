import 'package:fha/pages/splash_page.dart';
import 'package:fha/utils/app_bindings.dart';
import 'package:fha/utils/app_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';

// Firebase background handler
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Firebase Initialization.
  await Firebase.initializeApp();

  //Firebase background notifications
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Setting OverlayStyle.
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemStatusBarContrastEnforced: false,
    ),
  );

  // Ensuring Application Orientation.
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Hive Initialization.
  await Hive.initFlutter();

  // Dotenv Initialization.
  await dotenv.load(fileName: ".env");
  runApp(const FlutterApp());
}

class FlutterApp extends StatelessWidget {
  const FlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => GetMaterialApp(
        title: '',
        home: const SplashPage(),
        initialBinding: AppBindings(),
        theme: AppTheme.data(),
        debugShowCheckedModeBanner: false,
      );
}
