import 'dart:io';

import 'package:e_cart_ecommerce/consts/colors.dart';
import 'package:e_cart_ecommerce/consts/images.dart';
import 'package:e_cart_ecommerce/consts/strings.dart';
import 'package:e_cart_ecommerce/controller/profile_controller.dart';
import 'package:e_cart_ecommerce/widget_common/bg_widget.dart';
import 'package:e_cart_ecommerce/widget_common/custom_textfield.dart';
import 'package:e_cart_ecommerce/widget_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;

  const EditProfileScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put((ProfileController()));
    // var controller = Get.find<ProfileController>();

    return bgWidget(
        child: Scaffold(
      appBar: AppBar(),
      body: Obx(
        () => SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              data['imageUrl'] == '' && controller.profileImgPath.isEmpty
                  ? Image.asset(
                      imgProfile2,
                      width: 100,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : data['imageUrl'] != '' && controller.profileImgPath.isEmpty
                      ? Image.network(
                          data['imageUrl'],
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make()
                      : Image.file(
                          File(controller.profileImgPath.value),
                          width: 100,
                          fit: BoxFit.cover,
                        ).box.roundedFull.clip(Clip.antiAlias).make(),
              10.heightBox,
              ourButton(
                  color: redColor,
                  onPress: () async {
                    controller.changeImage(context);
                  },
                  textColor: whiteColor,
                  title: "Change"),
              10.heightBox,
              Divider(),
              20.heightBox,
              CustomTextField(
                controller: controller.nameController,
                hinttext: nameHint,
                title: name,
                isPass: false,
              ),
              CustomTextField(
                controller: controller.passController,
                hinttext: password,
                title: password,
                isPass: true,
              ),
              20.heightBox,
              controller.isloading.value
                  ? CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    )
                  : SizedBox(
                      width: context.screenWidth - 60,
                      child: ourButton(
                          color: redColor,
                          onPress: () async {
                            controller.isloading(true);
                            await controller.uploadProfileImage();
                            await controller.updateProfile(
                                imgurl: controller.profileImageLink,
                                name: controller.nameController.text,
                                password: controller.passController.text);
                            VxToast.show(context, msg: "Updated");
                          },
                          textColor: whiteColor,
                          title: "Save"),
                    )
            ],
          )
              .box
              .shadow
              .shadowSm
              .white
              .rounded
              .padding(EdgeInsets.all(16))
              .margin(EdgeInsets.only(top: 50, left: 12, right: 12))
              .make(),
        ),
      ),
    ));
  }
}
