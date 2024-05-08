import 'package:e_cart_ecommerce/consts/consts.dart';
import 'package:e_cart_ecommerce/views/splash%20screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyC47hXhZSVR2yCyEj21Ns9cqN6T7XuadQg",
        authDomain: "emart-4c4fe.firebaseapp.com",
        projectId: "emart-4c4fe",
        storageBucket: "emart-4c4fe.appspot.com",
        messagingSenderId: "979801189840",
        appId: "1:979801189840:web:cf8800372a320a2e395dd5"),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: const AppBarTheme(color: Colors.transparent),
          fontFamily: regular),
      home: const SplashScreen(),
    );
  }
}
