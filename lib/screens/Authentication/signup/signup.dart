import 'package:email_validator/email_validator.dart';
import 'package:finance_app/constants/app_colors.dart';
import 'package:finance_app/constants/app_routes.dart';
import 'package:finance_app/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:websafe_svg/websafe_svg.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.purple,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Text(
                  'fundi',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(fontSize: 35, color: AppColors.orange),
                ),
                const SizedBox(height: 30),
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
                  "Fill in your information and we'll send you a verification code through email",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Form(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.peach, width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.peach),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusColor: AppColors.peach,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppColors.peach, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintStyle: const TextStyle(color: Colors.white),
                          hintText: 'Email',
                          prefixIcon: const Icon(
                            Icons.email,
                            color: AppColors.peach,
                          ),
                        ),
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (email) =>
                            email != null && !EmailValidator.validate(email)
                                ? 'Enter a valid email'
                                : null,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.peach, width: 1.0),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.peach),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          focusColor: AppColors.peach,
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: AppColors.peach, width: 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          hintStyle: const TextStyle(color: Colors.white),
                          hintText: 'Password',
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: AppColors.peach,
                          ),
                          // suffixIcon: const Icon(Icons.red_eye)
                        ),
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) => value != null && value.length < 6
                            ? 'Enter at least 6 characters'
                            : null,
                      ),
                      const SizedBox(height: 30),
                      CustomAppButton(text: 'Next', press: signIn
                          //  () {
                          //   Get.toNamed(AppRoutes.verifyRoute);
                          // },
                          ),
                      const SizedBox(height: 50),
                      Container(
                        width: size.width,
                        child: Row(
                          children: const [
                            Expanded(child: Divider(color: Colors.white)),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Text('or continue with',
                                  style: TextStyle(color: AppColors.grey)),
                            ),
                            Expanded(child: Divider(color: Colors.white)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                height: 45,
                                width: 70,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.peach),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: WebsafeSvg.asset(
                                    'assets/icons/socials/facebook.svg',
                                    color: Colors.blue),
                              ),
                            ),
                            const SizedBox(width: 20),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                height: 45,
                                width: 70,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.peach),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: WebsafeSvg.asset(
                                    'assets/icons/socials/google.svg'),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      GestureDetector(
                        onTap: () => Get.offNamed(AppRoutes.loginRoute),
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 16),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Already have an account? ",
                                style: TextStyle(color: Colors.white),
                              ),
                              TextSpan(
                                text: 'Login here',
                                style: TextStyle(
                                    // fontWeight: FontWeight.w400,
                                    color: AppColors.orange),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
