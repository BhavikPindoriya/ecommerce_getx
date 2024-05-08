// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:e_cart_ecommerce/consts/consts.dart';
import 'package:e_cart_ecommerce/views/category_screen/item_details.dart';
import 'package:e_cart_ecommerce/widget_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  CategoryDetails({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: title!.text.white.fontFamily(bold).make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      6,
                      (index) => "Baby Clothing"
                          .text
                          .size(12)
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .makeCentered()
                          .box
                          .white
                          .margin(EdgeInsets.symmetric(horizontal: 4))
                          .size(120, 60)
                          .rounded
                          .make()),
                ),
              ),
              20.heightBox,
              // item container
              Expanded(
                  child: GridView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 6,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 250,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        imgP5,
                        width: 200,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      "Laptop 4GB/64GB"
                          .text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .make(),
                      10.heightBox,
                      "\$600"
                          .text
                          .color(redColor)
                          .fontFamily(bold)
                          .size(16)
                          .make()
                    ],
                  )
                      .box
                      .white
                      .roundedSM
                      .outerShadow
                      .margin(EdgeInsets.symmetric(horizontal: 4))
                      .padding(EdgeInsets.all(12))
                      .make()
                      .onTap(() {
                    Get.to(() => ItemDetails(title: "Dummy item"));
                  });
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
