import 'package:e_cart_ecommerce/consts/consts.dart';
import 'package:flutter/material.dart';

Widget featuredButton({String? title, String? Icon}) {
  return Row(
    children: [
      Image.asset(
        Icon!,
        width: 60,
        fit: BoxFit.fill,
      ),
      10.widthBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make()
    ],
  )
      .box
      .width(200)
      .white
      .padding(EdgeInsets.all(4))
      .margin(EdgeInsets.symmetric(horizontal: 4))
      .roundedSM
      .outerShadowSm
      .make();
}
