import 'package:e_cart_ecommerce/consts/consts.dart';
import 'package:flutter/material.dart';

Widget CustomTextField({String? title, String? hinttext, controller, isPass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: isPass,
        controller: controller,
        decoration: InputDecoration(
            hintStyle: TextStyle(
              fontFamily: semibold,
              color: textfieldGrey,
            ),
            hintText: hinttext,
            isDense: true, // small size
            fillColor: lightGrey,
            filled: true,
            border: InputBorder.none, // borderd remove
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: redColor))),
      ),
      5.heightBox
    ],
  );
}
