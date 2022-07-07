import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class DisplayCardIncome extends StatelessWidget {
  const DisplayCardIncome({
    Key? key,
    required this.heading,
    required this.icon,
    required this.number,
    this.isEx = false,
  }) : super(key: key);

  final String heading;
  final IconData icon;
  final double number;
  final bool? isEx;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: Colors.green,
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isEx! ? "-$heading" : heading,
                style: const TextStyle(
                  color: AppColors.light,
                ),
              ),
              Text(
                'R $number',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
