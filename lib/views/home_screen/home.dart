import 'package:e_cart_ecommerce/consts/consts.dart';
import 'package:e_cart_ecommerce/controller/home_controller.dart';
import 'package:e_cart_ecommerce/views/cart_screen/cart_screen.dart';
import 'package:e_cart_ecommerce/views/category_screen/category_screen.dart';
import 'package:e_cart_ecommerce/views/home_screen/home_screen.dart';
import 'package:e_cart_ecommerce/views/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 26,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: 26,
          ),
          label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 26,
          ),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 26,
          ),
          label: account),
    ];

    var navBody = [
      HomeScreen(),
      CategoryScreen(),
      CartScreen(),
      ProfileScreen()
    ];

    return Scaffold(
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value),
            ),
          ), // element at ne je ape index apiaw te index ni list index ne return karse
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: redColor,
          selectedLabelStyle: TextStyle(fontFamily: semibold),
          type: BottomNavigationBarType
              .fixed, // aa line navigation ma je icon chhe te uper niche avse aline add karvathi icon same lime ma fix thai jase and lable pan show thase
          backgroundColor: whiteColor,
          items: navbarItem,
          onTap: (Value) {
            controller.currentNavIndex.value = Value;
          },
        ),
      ),
    );
  }
}
