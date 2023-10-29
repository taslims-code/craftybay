import 'package:ecommerce/presentation/state%20holders/auth_controller.dart';
import 'package:ecommerce/presentation/ui/screens/auth/email_verification_screen.dart';
import 'package:ecommerce/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/crafty_bay_logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    gotoHomePage();
  }

  void gotoHomePage() async {
    await AuthController.getAccessToken();
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => Get.offAll(
        () => AuthController.isLoggedIn
            ? const MainBottomNavScreen()
            : const EmailVerificationScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Spacer(),
          CraftyBayLogoWidget(),
          Spacer(),
          CircularProgressIndicator(),
          SizedBox(
            height: 16,
          ),
          Text('Version 1.0.0'),
          SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
