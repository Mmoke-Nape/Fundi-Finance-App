import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';

class VerificationScreen extends StatefulWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  State<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.purple,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  'fundi',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 35, color: AppColors.orange),
                ),
                Center(
                  child: Column(children: [
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Create account',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Enter the code we sent to your email",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 20),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
