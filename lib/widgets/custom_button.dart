import 'package:finance_app/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomAppButton extends StatelessWidget {
  const CustomAppButton({
    Key? key,
    required this.text,
    required this.press,
  }) : super(key: key);
  final String text;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        width: size.width,
        height: 60,
        decoration: const BoxDecoration(
          color: AppColors.orange,
          // border: Border.all(color: AppColors.purple),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
