import 'package:finance_app/widgets/navAppbar/navAppbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_routes.dart';
import '../../constants/constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<SettingsItem> settingsListItems = [
      SettingsItem(
          heading: 'App PIN',
          icon: 'assets/icons/settings/key.svg',
          press: () {}),
      SettingsItem(
          heading: 'Profile',
          icon: 'assets/icons/settings/person_circle.svg',
          press: () {}),
      SettingsItem(
          heading: 'Currency',
          icon: 'assets/icons/settings/currency.svg',
          press: () {
            Get.toNamed(AppRoutes.userProfileRoute);
          }),
      SettingsItem(
          heading: 'Language',
          icon: 'assets/icons/settings/langauge.svg',
          press: () {}),
      SettingsItem(
          heading: 'Dark mode',
          icon: 'assets/icons/settings/darkmode.svg',
          press: () {}),
      SettingsItem(
          heading: 'Help and support',
          icon: 'assets/icons/settings/help.svg',
          press: () {}),
      SettingsItem(
          heading: 'Privacy and Security',
          icon: 'assets/icons/settings/shield.svg',
          press: () {}),
    ];
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.light,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(Icons.add),
          backgroundColor: AppColors.orange,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              NavAppBar(
                text: 'Settings',
                press: () {},
              ),
              const SizedBox(height: 20),
              Container(
                width: size.width,
                // height: s
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => SettingsListItem(
                    icon: settingsListItems[index].icon,
                    press: settingsListItems[index].press,
                    text: settingsListItems[index].heading,
                  ),
                  separatorBuilder: (context, index) => const Divider(
                    color: AppColors.grey,
                  ),
                  itemCount: settingsListItems.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingsListItem extends StatelessWidget {
  const SettingsListItem({
    Key? key,
    required this.text,
    required this.press,
    required this.icon,
  }) : super(key: key);

  final String text;
  final Function() press;
  final String icon;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: SizedBox(
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: AppColors.peach,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: WebsafeSvg.asset(icon),
                  ),
                  const SizedBox(width: 10),
                  Text(text),
                ],
              ),
            ),
            const Icon(Icons.keyboard_arrow_right, color: AppColors.orange),
          ],
        ),
      ),
    );
  }
}
