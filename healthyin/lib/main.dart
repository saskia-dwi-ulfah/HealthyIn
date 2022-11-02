import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:healthyin/screens/Splash%20Screen/healthyin_splashscreen_page.dart';
import 'package:healthyin/screens/Login%20Page/healthyin_login_page.dart';
import 'package:healthyin/screens/Signup%20Page/healthyin_signup_page.dart';
import 'package:healthyin/screens/Self%20Screening/screening_1.dart';
import 'package:healthyin/screens/Self%20Screening/screening_2.dart';
import 'package:healthyin/screens/Self%20Screening/screening_3.dart';
import 'package:healthyin/screens/Self%20Screening/screening_4.dart';
import 'package:healthyin/screens/Self%20Screening/screening_5.dart';
import 'package:healthyin/screens/Self%20Screening/screening_6.dart';
import 'package:healthyin/screens/Self%20Screening/screening_7.dart';
import 'package:healthyin/screens/Screening%20Result/recommendation_moderate.dart';
import 'package:healthyin/screens/Screening%20Result/recommendation_severe.dart';
import 'package:healthyin/screens/Screening%20Result/recommendation_mild.dart';
import 'package:healthyin/controller/auth_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'HealthyIn',
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        home: HealthyInSplashScreen());
  }
}
