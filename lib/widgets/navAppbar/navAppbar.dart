import 'package:finance_app/widgets/navAppbar/nav_clipper.dart';
import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class NavAppBar extends StatelessWidget {
  const NavAppBar({Key? key, required this.text, required this.press})
      : super(key: key);

  final String text;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.topCenter,
      clipBehavior: Clip.none,
      children: [
        ClipPath(
          clipper: NavClipper(),
          child: Container(
            alignment: Alignment.topCenter,
            width: size.width,
            height: size.height * .19,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            color: AppColors.orange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CircleAvatar(
                  radius: 20,
                  foregroundImage: AssetImage('assets/images/me/me.jpg'),
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
          bottom: 0,
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            width: size.width - 40,
            height: size.height * .1,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: BoxDecoration(
              color: AppColors.purple,
              borderRadius: BorderRadius.circular(15),
            ),
            child: GestureDetector(
              onTap: press,
              child: Row(
                children: [
                  const Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white,
                    size: 20,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
