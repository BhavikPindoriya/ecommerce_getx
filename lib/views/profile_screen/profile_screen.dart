import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cart_ecommerce/consts/consts.dart';
import 'package:e_cart_ecommerce/consts/list.dart';
import 'package:e_cart_ecommerce/controller/auth_controller.dart';
import 'package:e_cart_ecommerce/controller/profile_controller.dart';
import 'package:e_cart_ecommerce/services/firestore_services.dart';
import 'package:e_cart_ecommerce/views/auth_screen/login_screen.dart';
import 'package:e_cart_ecommerce/views/profile_screen/components/details_card.dart';
import 'package:e_cart_ecommerce/views/profile_screen/edit_profile_screen.dart';
import 'package:e_cart_ecommerce/widget_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put((ProfileController()));
    return bgWidget(
      child: Scaffold(
        body: StreamBuilder(
          stream: FirestoreServices.getUser(currentUSer!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else {
              var data = snapshot.data!.docs[0];
              Vx.log(data['name']);
              // docs lakhvu hoy to apne  AsyncSnapshot<QuerySnapshot> add karvi pade snapshot pahela

              return SafeArea(
                child: Column(
                  children: [
                    //edit profile button
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ).onTap(() {
                        controller.nameController.text = data['name'];
                        controller.passController.text = data['password'];

                        Get.to(() => EditProfileScreen(
                              data: data,
                            ));
                      }),
                    ),
                    //users details section

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          data['imageUrl'] == ''
                              ? Image.asset(
                                  imgProfile2,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ).box.roundedFull.clip(Clip.antiAlias).make()
                              : Image.network(
                                  data['imageUrl'],
                                  width: 80,
                                  fit: BoxFit.cover,
                                ).box.roundedFull.clip(Clip.antiAlias).make(),
                          10.widthBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "${data['name']}"
                                    .text
                                    .fontFamily(semibold)
                                    .white
                                    .make(),
                                "${data['email']}".text.white.make()
                              ],
                            ),
                          ),
                          OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                  side: BorderSide(color: whiteColor)),
                              onPressed: () async {
                                await Get.put(AuthController())
                                    .signOutMethod(context);
                                Get.offAll(() => LoginScreen());
                              },
                              child: "logout"
                                  .text
                                  .white
                                  .fontFamily(semibold)
                                  .make())
                        ],
                      ),
                    ),

                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        detailsCard(
                            count: data['cart_count'],
                            title: "in your cart",
                            width: context.screenWidth / 3.4),
                        detailsCard(
                            count: data['wishlist_count'],
                            title: "in your wishlist",
                            width: context.screenWidth / 3.4),
                        detailsCard(
                            count: data['order_count'],
                            title: "your orders",
                            width: context.screenWidth / 3.4),
                      ],
                    ),

                    //buttons section

                    ListView.separated(
                            shrinkWrap: true,
                            itemCount: profilebuttonlist.length,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: profilebuttonlist[index]
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                leading: Image.asset(
                                  profileButtonIcon[index],
                                  width: 22,
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context, int index) {
                              return Divider(
                                color: lightGrey,
                              );
                            })
                        .box
                        .white
                        .rounded
                        .shadowSm
                        .margin(EdgeInsets.all(12))
                        .padding(EdgeInsets.symmetric(horizontal: 16))
                        .make()
                        .box
                        .color(redColor)
                        .make()
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
