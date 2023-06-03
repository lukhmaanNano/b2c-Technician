import 'package:b2ctechnician/services/changePassword.dart';
import 'package:b2ctechnician/services/emailService.dart';
import 'package:b2ctechnician/services/json.dart';
import 'package:b2ctechnician/services/logOut.dart';
import 'package:b2ctechnician/services/loginService.dart';
import 'package:b2ctechnician/services/verifyOtp.dart';
import 'package:b2ctechnician/styles/common%20Color.dart';
import 'package:b2ctechnician/splash.dart';
import 'package:b2ctechnician/services/branding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  Get.put(BrandingControl());
  Get.put(LoginController());
  Get.put(EmailController());
  Get.put(OTPController());
  Get.put(Json());
  Get.put(LogoutControl());
  Get.put(ChangePasswordController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // themeMode: ThemeMode.dark,
      scrollBehavior: const ScrollBehavior(
          androidOverscrollIndicator: AndroidOverscrollIndicator.stretch),
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
            elevation: 0,
            titleTextStyle: TextStyle(fontFamily: 'Eras Demi', fontSize: 20)),
        buttonTheme: const ButtonThemeData(
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        checkboxTheme: CheckboxThemeData(
          shape: const CircleBorder(),
          checkColor: MaterialStateProperty.all(Colors.white),
          fillColor: MaterialStateProperty.all(const Color(0xFF21446F)),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          ),
        ),
        dividerColor: buttonForeground,
        primaryColor: const Color(0xFF21446F),
        scaffoldBackgroundColor: Styles.scaffoldBackgroundColor,
        scrollbarTheme: Styles.scrollbarTheme,
      ),
      title: 'Technician',
      home: Splash(),
    );
  }
}
