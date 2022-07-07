import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import 'income_card.dart';

class DisplayOverallData extends StatelessWidget {
  const DisplayOverallData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      width: size.width - 40,
      height: size.height * .27,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.purple,
        borderRadius: BorderRadius.circular(15),
      ),
      child: GestureDetector(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Current balance',
                style: TextStyle(
                  // fontSize: 23,
                  // fontWeight: FontWeight.bold,
                  color: AppColors.light,
                ),
              ),
              // const SizedBox(height: 10),
              const Text(
                'R608,934.43',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const Divider(
                color: AppColors.light,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  DisplayCardIncome(
                      heading: 'Income',
                      icon: Icons.trending_up,
                      number: 21563),
                  DisplayCardIncome(
                      heading: 'Expence',
                      icon: Icons.trending_down_outlined,
                      number: 21563),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
