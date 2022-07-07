import 'package:finance_app/screens/Authentication/forgot%20password/forgot_password.dart';
import 'package:finance_app/screens/Authentication/landing/landingScreen.dart';
import 'package:finance_app/screens/Authentication/signup/signup.dart';
import 'package:finance_app/screens/Authentication/signup/utils.dart';
import 'package:finance_app/screens/Home/home.dart';
import 'package:finance_app/screens/User%20Profile/user_profile.dart';
import 'package:finance_app/screens/settings/settings_screen.dart';
import 'package:finance_app/topLevel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/app_routes.dart';
import '../screens/Authentication/login/loginScreen.dart';
import '../screens/Authentication/verification/verification_screen.dart';
import 'sample_feature/sample_item_details_view.dart';
import 'sample_feature/sample_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],
          debugShowCheckedModeBanner: false,
          scaffoldMessengerKey: Utils.messengerKey,
          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.light,
            textTheme: TextTheme(
              bodyText2: GoogleFonts.poppins(),
              headline2: GoogleFonts.ultra()
                  .copyWith(color: Colors.white, fontSize: 70),
            ),
          ),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          // home: const ForgotPasswordScreen(),
          // home: const HomeScreen(),
          home: const SettingsScreen(),
          // home: const TopLevel(),
          // home: const LandingScreen(),
          // home: const UserProfile(),

          getPages: [
            GetPage(
              name: AppRoutes.topLevelRoute,
              page: () => const TopLevel(),
            ),
            GetPage(
              name: AppRoutes.signUpRoute,
              page: () => const SignUpScreen(),
              title: 'Signup for an account',
            ),
            GetPage(
              name: AppRoutes.loginRoute,
              page: () => const LoginScreen(),
              title: 'Login to your account',
            ),
            GetPage(
              name: AppRoutes.verifyRoute,
              page: () => const VerificationScreen(),
              title: 'Verify your account',
            ),
            GetPage(
              name: AppRoutes.forgotPasswordRoute,
              page: () => const ForgotPasswordScreen(),
              title: 'Forgot Password',
            ),
            GetPage(
              name: AppRoutes.homeRoute,
              page: () => const HomeScreen(),
              title: 'Home',
            ),
            GetPage(
              name: AppRoutes.userProfileRoute,
              page: () => const UserProfile(),
              title: 'Your Profile',
            ),
            GetPage(
              name: AppRoutes.settingsRoute,
              page: () => const SettingsScreen(),
              title: 'Settings',
            ),
          ],
        );
      },
    );
  }
}
