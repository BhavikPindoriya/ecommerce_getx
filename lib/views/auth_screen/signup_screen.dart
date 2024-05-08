import 'package:e_cart_ecommerce/consts/consts.dart';
import 'package:e_cart_ecommerce/controller/auth_controller.dart';
import 'package:e_cart_ecommerce/views/home_screen/home.dart';
import 'package:e_cart_ecommerce/widget_common/applogo_widget.dart';
import 'package:e_cart_ecommerce/widget_common/bg_widget.dart';
import 'package:e_cart_ecommerce/widget_common/custom_textfield.dart';
import 'package:e_cart_ecommerce/widget_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool? isCheck = false;
  var controller = Get.put(AuthController()); //add the controller

  //text Controller

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var retypepasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        resizeToAvoidBottomInset:
            false, // click The textformfield then overflow the widget
        body: Center(
          child: Obx(
            () => Column(
              children: [
                (context.screenHeight * 0.1)
                    .heightBox, // screen height wise 10 persentage height apvama avse screen ne
                applogowidget(),
                10.heightBox,
                "Join the $appname".text.fontFamily(bold).white.size(18).make(),
                15.heightBox,

                Column(
                  children: [
                    CustomTextField(
                        hinttext: nameHint,
                        title: name,
                        isPass: false,
                        controller: nameController),
                    CustomTextField(
                        hinttext: EmailHint,
                        title: email,
                        isPass: false,
                        controller: emailController),
                    CustomTextField(
                        hinttext: passwordHint,
                        title: password,
                        isPass: true,
                        controller: passwordController),
                    CustomTextField(
                        hinttext: passwordHint,
                        title: retypepassword,
                        isPass: true,
                        controller: retypepasswordController),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: forgotpassword.text.make(),
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                            activeColor: redColor,
                            checkColor: whiteColor,
                            value: isCheck,
                            onChanged: (newvalue) {
                              setState(() {});
                              isCheck = newvalue;
                            }),
                        5.widthBox,
                        Expanded(
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                    text: "I agree to the ",
                                    style: TextStyle(
                                        fontFamily: regular, color: fontGrey)),
                                TextSpan(
                                    text: termAndCond,
                                    style: TextStyle(
                                        fontFamily: regular, color: redColor)),
                                TextSpan(
                                    text: " & ",
                                    style: TextStyle(
                                        fontFamily: regular, color: fontGrey)),
                                TextSpan(
                                    text: privacyPolicy,
                                    style: TextStyle(
                                        fontFamily: regular, color: redColor)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    5.heightBox,
                    controller.isloding.value
                        ? CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(redColor),
                          )
                        : ourButton(
                            color: isCheck == true ? redColor : lightGrey,
                            title: Signup,
                            textColor: whiteColor,
                            onPress: () async {
                              if (isCheck != false) {
                                controller.isloding(true);

                                try {
                                  await controller.SignupMethod(
                                          context: context,
                                          email: emailController.text,
                                          password: passwordController.text)
                                      .then((value) {
                                    return controller.storeUserData(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        name: nameController.text);
                                  }).then((value) {
                                    VxToast.show(context, msg: loggedin);
                                    Get.offAll(() => Home());
                                  });
                                } catch (e) {
                                  auth.signOut();
                                  VxToast.show(context, msg: e.toString());
                                  controller.isloding(false);
                                }
                              }
                            },
                          ).box.width(context.screenWidth - 50).make(),
                    10.heightBox,
                    RichText(
                      text: const TextSpan(children: [
                        TextSpan(
                          text: alredyhaveaccount,
                          style: TextStyle(fontFamily: bold, color: fontGrey),
                        ),
                        TextSpan(
                          text: login,
                          style: TextStyle(fontFamily: bold, color: redColor),
                        ),
                      ]),
                    ).onTap(() {
                      Get.back();
                    })
                  ],
                )
                    .box
                    .white
                    .rounded
                    .padding(EdgeInsets.all(16))
                    .width(context.screenWidth - 70)
                    .shadowSm
                    .make(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
