import 'package:ecommerce/presentation/state%20holders/email_verification_controller.dart';
import 'package:ecommerce/presentation/ui/screens/auth/otp_verification_screen.dart';
import 'package:ecommerce/presentation/ui/utility/app_colors.dart';
import 'package:ecommerce/presentation/ui/widgets/crafty_bay_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 100,
                ),
                const CraftyBayLogoWidget(),
                Text(
                  'Welcome back',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Please enter your email address',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _emailTEController,
                  validator: (String? email) {
                    if (email?.isEmpty ?? true) {
                      return 'Enter your email address';
                    } else if (email!.isEmail == false) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.primaryColor)),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 16,
                      ),
                      hintText: 'Email Address',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: Colors.grey)),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: GetBuilder<EmailVerificationController>(
                    builder: (controller) {
                      if (controller.emailVerificationOnGoing) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            verifyEmail(controller);
                          }
                        },
                        child: const Text('Next'),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> verifyEmail(EmailVerificationController controller) async {
    final response =
        await controller.verifyEmail(_emailTEController.text.trim());

    if (response) {
      Get.to(() => OTPVerificationScreen(
            email: _emailTEController.text.trim(),
          ));
    } else {
      if (mounted) {
        Get.snackbar('Failed', 'Email verification failed! Try again');
      }
    }
  }
}
