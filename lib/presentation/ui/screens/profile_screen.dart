import 'package:ecommerce/presentation/state%20holders/profile_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileScreenController profileScreenController =
      Get.find<ProfileScreenController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      profileScreenController.getProfileData();
      print(profileScreenController.profile.firstName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
        elevation: 0,
      ),
      body: GetBuilder<ProfileScreenController>(builder: (_) {
        if (profileScreenController.getProfileScreenInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
                child: Text(
                    profileScreenController.profile.firstName ?? 'No Data'),
              ),
              Container(
                child: const Text('last name'),
              ),
              Container(
                child: const Text('mobile'),
              ),
              Container(
                child: const Text('city'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
