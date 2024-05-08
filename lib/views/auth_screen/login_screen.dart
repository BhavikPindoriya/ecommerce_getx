import 'package:e_cart_ecommerce/consts/consts.dart';
import 'package:e_cart_ecommerce/consts/list.dart';
import 'package:e_cart_ecommerce/controller/auth_controller.dart';
import 'package:e_cart_ecommerce/views/auth_screen/signup_screen.dart';
import 'package:e_cart_ecommerce/views/home_screen/home.dart';
import 'package:e_cart_ecommerce/widget_common/applogo_widget.dart';
import 'package:e_cart_ecommerce/widget_common/bg_widget.dart';
import 'package:e_cart_ecommerce/widget_common/custom_textfield.dart';
import 'package:e_cart_ecommerce/widget_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  var controller = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset:
            false, // click The textformfield then overflow the widget
        body: Center(
          child: Column(
            children: [
              (context.screenHeight * 0.1)
                  .heightBox, // screen height wise 10 persentage height apvama avse screen ne
              applogowidget(),
              10.heightBox,
              "Login in to $appname"
                  .text
                  .fontFamily(bold)
                  .white
                  .size(18)
                  .make(),
              15.heightBox,

              Obx(
                () => Column(
                  children: [
                    CustomTextField(
                        hinttext: EmailHint,
                        title: email,
                        isPass: false,
                        controller: controller.emailController),
                    CustomTextField(
                        hinttext: passwordHint,
                        title: password,
                        isPass: true,
                        controller: controller.passwordController),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: forgotpassword.text.make(),
                      ),
                    ),
                    5.heightBox,
                    controller.isloding.value
                        ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          )
                        : ourButton(
                            color: redColor,
                            title: login,
                            textColor: whiteColor,
                            onPress: () async {
                              controller.isloding(true);
                              await controller
                                  .loginMethod(context: context)
                                  .then(
                                (value) {
                                  if (value != null) {
                                    VxToast.show(context, msg: loggedin);
                                    Get.offAll(() => Home());
                                  } else {
                                    controller.isloding(false);
                                  }
                                },
                              );
                            },
                          ).box.width(context.screenWidth - 50).make(),
                    5.heightBox,
                    CreateNewAccount.text.color(fontGrey).make(),
                    5.heightBox,
                    ourButton(
                      color: lightgolden,
                      title: Signup,
                      textColor: redColor,
                      onPress: () {
                        Get.to(() => SignUpScreen());
                      },
                    ).box.width(context.screenWidth - 50).make(),
                    10.heightBox,
                    loginwith.text.color(fontGrey).make(),
                    5.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        //print the social logo icon
                        3,
                        (index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            backgroundColor: lightGrey,
                            radius: 25,
                            child: Image.asset(
                              socialIconList[index],
                              width: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
                    .box
                    .white
                    .rounded
                    .padding(EdgeInsets.all(16))
                    .width(context.screenWidth - 70)
                    .shadowSm
                    .make(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
