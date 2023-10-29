import 'dart:developer';

import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utility/urls.dart';
import 'package:ecommerce/presentation/state%20holders/auth_controller.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController {
  bool _otpVerificationInProgress = false;
  String _errorMessage = '';

  bool get otpVerificationInProgress => _otpVerificationInProgress;

  String get message => _errorMessage;

  Future<bool> getCompleteProfile() async {
    NetworkResponse response = await NetworkCaller.getRequest(Urls.getProfile);

    if (response.isSuccess &&
        response.jsonResponse!['msg'] == 'success' &&
        response.jsonResponse!['data'] != null) {
      log('getProfile msg ${response.jsonResponse!['msg']}');
      log('getProfile data ${response.jsonResponse!['data']}');
      return true;
    } else {
      _errorMessage = 'Complete profile data fetching failed!';
      return false;
    }
  }

  Future<bool> verifyOtp(String email, String otp) async {
    _otpVerificationInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.verifyOtp(email, otp));
    _otpVerificationInProgress = false;
    update();
    if (response.isSuccess) {
      await AuthController.setAccessToken(response.jsonResponse?['data']);
      return true;
    } else {
      return false;
    }
  }
}
