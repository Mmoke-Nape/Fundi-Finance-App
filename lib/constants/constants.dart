import 'package:finance_app/constants/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Constants {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(child: Text("USA"), value: "USA"),
    DropdownMenuItem(child: Text("Canada"), value: "Canada"),
    DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
    DropdownMenuItem(child: Text("England"), value: "England"),
  ];
}

class SettingsItem {
  final String heading;
  final String icon;
  final Function() press;

  SettingsItem({
    required this.heading,
    required this.icon,
    required this.press,
  });
}
