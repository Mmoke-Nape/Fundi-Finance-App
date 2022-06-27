import 'package:finance_app/constants/app_colors.dart';
import 'package:finance_app/constants/app_routes.dart';
import 'package:finance_app/widgets/top_clipper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../widgets/signup_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.orange,
        body: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipPath(
                clipper: TopClipper(),
                child: Container(
                  width: size.width,
                  height: size.height * .45,
                  color: AppColors.purple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Column(
                    children: [
                      Text(
                        'fundi',
                        style: Theme.of(context)
                            .textTheme
                            .headline2!
                            .copyWith(fontSize: 35, color: AppColors.orange),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Positioned(
                              right: 0,
                              bottom: 10,
                              child: WebsafeSvg.asset(
                                  'assets/illustrations/undraw_financial_data_re_p0fl.svg',
                                  width: size.width * .6),
                            ),
                            // Positioned(
                            //   right: 0,
                            //   child: WebsafeSvg.asset(
                            //       'assets/illustrations/undraw_savings_re_eq4w.svg'),
                            // ),
                            Positioned(
                              left: 0,
                              bottom: 0,
                              child: WebsafeSvg.asset(
                                  'assets/illustrations/undraw_statistic_chart_re_w0pk.svg',
                                  width: size.width * .42),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: size.width,
                height: size.height * .55,
                padding: const EdgeInsets.symmetric(horizontal: 30),
                // color: AppColors.lightBrown,
                child: Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 38),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Take care\n",
                            style: TextStyle(color: AppColors.purple),
                          ),
                          TextSpan(
                            text: 'of your finances',
                            style: TextStyle(
                                // fontWeight: FontWeight.w400,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60),
                    SignupButton(
                        text: 'Login to account',
                        press: () => Get.offNamed(AppRoutes.loginRoute)),
                    const SizedBox(height: 20),
                    SignupButton(
                        text: 'Create an account',
                        press: () => Get.offNamed(AppRoutes.signUpRoute),
                        isFilled: false),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
