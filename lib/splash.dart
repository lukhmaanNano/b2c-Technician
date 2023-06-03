import 'package:b2ctechnician/screens/login/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:b2ctechnician/services/branding.dart';
import 'package:get/get.dart';
import 'dart:async';

import 'FireBase_Notification/NotificationServices.dart';
import 'screens/home.dart';

class Splash extends StatefulWidget {
  Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final BrandingControl _brandingControl = Get.find<BrandingControl>();
  NotificationServices notificationServices = NotificationServices();
  List<dynamic> brandingData = [];
  int? sessionId;
  @override
  void initState() {
    super.initState();
    splashFunction();
    brandingFunc();
    notificationServices.requestNotificationPermissions();
    notificationServices.getDeviceToken().then((value) {
      if (kDebugMode) {
        print("Device token");
        print(value);
      }
    });
    notificationServices.firebaseInit();
  }

  Future<void> brandingFunc() async {
    await _brandingControl.brandingApi(context);
    final response = _brandingControl.brandingData;
    setState(() {
      brandingData = response;
    });
  }

  Future<void> splashFunction() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      sessionId = prefs.getInt('SessionId');
    });
    Timer(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    sessionId == null ? Login() : const Home())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Hero(
          tag: 'login',
          child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 60,
              child: Image.asset('assets/images/lognano.png')),
        ));
  }
}
