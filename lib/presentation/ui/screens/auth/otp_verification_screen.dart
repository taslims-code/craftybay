import 'dart:developer';

import 'package:ecommerce/presentation/state%20holders/otp_timer_controller.dart';
import 'package:ecommerce/presentation/state%20holders/otp_verification_controller.dart';
import 'package:ecommerce/presentation/ui/screens/auth/complete_profile_screen.dart';
import 'package:ecommerce/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce/presentation/ui/widgets/crafty_bay_logo_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../../utility/app_colors.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String email;
  const OTPVerificationScreen({super.key, required this.email});

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  OtpTimerController timerController = Get.find();
  final TextEditingController _otpVerificationTEController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    timerController.startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const CraftyBayLogoWidget(),
                Text(
                  'Enter OTP Code',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'A 6 digit OTP code has been sent',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 16,
                ),
                Pinput(
                  length: 6,
                  controller: _otpVerificationTEController,
                  onCompleted: (pin) {
                    if (kDebugMode) {
                      print(pin);
                    }
                  },
                ),
                /*Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: TextFormField(
                          controller: _otpVerificationTEController1,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          autofocus: true,
                          onSaved: (pin1) {},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          maxLength: 1,
                          decoration: const InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: TextFormField(
                          controller: _otpVerificationTEController2,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          autofocus: true,
                          onSaved: (pin2) {},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          maxLength: 1,
                          decoration: const InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: TextFormField(
                          controller: _otpVerificationTEController3,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          autofocus: true,
                          onSaved: (pin3) {},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          maxLength: 1,
                          decoration: const InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: TextFormField(
                          controller: _otpVerificationTEController4,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleLarge,
                          keyboardType: TextInputType.number,
                          autofocus: true,
                          onSaved: (pin4) {},
                          onChanged: (value) {
                            if (value.length == 1) {
                              FocusScope.of(context).nextFocus();
                            }
                          },
                          maxLength: 1,
                          decoration: const InputDecoration(
                            counterText: '',
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),*/
                const SizedBox(
                  height: 24,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<OtpVerificationController>(
                    builder: (otpVerificationController) {
                      if (otpVerificationController.otpVerificationInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ElevatedButton(
                        onPressed: () async {
                          await verifyOtp(otpVerificationController);
                          await readProfile(otpVerificationController);
                        },
                        child: const Text('Next'),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'This code will expire in ',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: Colors.grey),
                    ),
                    Obx(
                      () => Text(
                        '${timerController.time.value} s',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: AppColors.primaryColor,
                            ),
                      ),
                    ),
                  ],
                ),
                Obx(
                  () => TextButton(
                    onPressed: () {},
                    child: Text(
                      'Resend Code',
                      style: TextStyle(
                        color: timerController.time.value != '0'
                            ? Colors.grey
                            : AppColors.primaryColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> readProfile(
      OtpVerificationController otpVerificationController) async {
    final res = await otpVerificationController.getCompleteProfile();

    if (res == true) {
      log('Read profile success');

      Get.offAll(() => const MainBottomNavScreen());
    } else {
      log('Read profile failed');

      Get.to(() => CompleteProfileScreen());
    }
  }

  Future<void> verifyOtp(
      OtpVerificationController otpVerificationController) async {
    final response = await otpVerificationController.verifyOtp(
      widget.email,
      _otpVerificationTEController.text.trim(),
    );
    if (response == true) {
      // Get.offAll(() => const MainBottomNavScreen());
      log('successfully verified!');
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Otp verification failed! Try again'),
          ),
        );
      }
    }
  }
}
