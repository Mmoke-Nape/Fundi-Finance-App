import 'package:finance_app/constants/app_routes.dart';
import 'package:finance_app/screens/Home/widgets/displayCard.dart';
import 'package:finance_app/topLevel.dart';
import 'package:finance_app/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/app_colors.dart';
import '../../widgets/navAppbar/nav_clipper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser!;
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                clipBehavior: Clip.none,
                children: [
                  ClipPath(
                    clipper: NavClipper(),
                    child: Container(
                      alignment: Alignment.topCenter,
                      width: size.width,
                      height: size.height * .25,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      color: AppColors.orange,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          CircleAvatar(
                            radius: 20,
                            foregroundImage:
                                AssetImage('assets/images/me/me.jpg'),
                            foregroundColor: AppColors.grey,
                          ),
                          Icon(
                            Icons.home_outlined,
                            color: Colors.white,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -size.height * .13,
                    child: const DisplayOverallData(),
                  ),
                ],
              ),
              // Text(user.email!),
              // CustomAppButton(
              //     text: 'LOGOUT BRUH',
              //     press: () {
              //       FirebaseAuth.instance.signOut();
              //       Get.offAllNamed(AppRoutes.topLevelRoute);
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}
