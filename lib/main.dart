import 'package:e_cart_ecommerce/consts/consts.dart';
import 'package:e_cart_ecommerce/views/splash%20screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
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
          appBarTheme: AppBarTheme(color: Colors.transparent),
          fontFamily: regular),
      home: SplashScreen(),
    );
  }
}
