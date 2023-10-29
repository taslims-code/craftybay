import 'package:ecommerce/presentation/state%20holders/complete_profile_controller.dart';
import 'package:ecommerce/presentation/ui/screens/main_bottom_nav_screen.dart';
import 'package:ecommerce/presentation/ui/widgets/crafty_bay_logo_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteProfileScreen extends StatelessWidget {
  final TextEditingController _nameTEC = TextEditingController();
  final TextEditingController _addressTEC = TextEditingController();
  final TextEditingController _cityTEC = TextEditingController();
  final TextEditingController _stateTEC = TextEditingController();
  final TextEditingController _postCodeTEC = TextEditingController();
  final TextEditingController _countryTEC = TextEditingController();
  final TextEditingController _mobileTEC = TextEditingController();

  CompleteProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const CraftyBayLogoWidget(),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Complete Profile',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Get started with us with your details',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Colors.grey),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _nameTEC,
                  decoration: const InputDecoration(
                    hintText: 'Name',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _countryTEC,
                  decoration: const InputDecoration(
                    hintText: 'Country',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _stateTEC,
                  decoration: const InputDecoration(
                    hintText: 'State',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _cityTEC,
                  decoration: const InputDecoration(
                    hintText: 'City',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _postCodeTEC,
                  decoration: const InputDecoration(
                    hintText: 'Post Code',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _mobileTEC,
                  decoration: const InputDecoration(
                    hintText: 'Phone',
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _addressTEC,
                  maxLines: 6,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 16,
                    ),
                    hintText: 'Shipping Address',
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                GetBuilder<CompleteProfileController>(
                    builder: (completeProfileController) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        var response =
                            await completeProfileController.postCompleteProfile(
                          _nameTEC.text.trim(),
                          _countryTEC.text.trim(),
                          _stateTEC.text.trim(),
                          _cityTEC.text.trim(),
                          _postCodeTEC.text.trim(),
                          _mobileTEC.text.trim(),
                          _addressTEC.text.trim(),
                        );
                        // );
                        if (response) {
                          Get.offAll(() => const MainBottomNavScreen());
                        }
                      },
                      child: const Text('Complete'),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
