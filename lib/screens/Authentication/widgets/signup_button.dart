import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class SignupButton extends StatelessWidget {
  const SignupButton({
    Key? key,
    required this.text,
    this.isFilled = true,
    required this.press,
  }) : super(key: key);
  final String text;
  final bool isFilled;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: press,
      child: Container(
        alignment: Alignment.center,
        width: size.width,
        height: 70,
        decoration: BoxDecoration(
          color: isFilled ? AppColors.purple : AppColors.orange,
          border: Border.all(color: AppColors.purple),
          borderRadius: const BorderRadius.all(Radius.circular(15)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isFilled ? Colors.white : AppColors.purple,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
