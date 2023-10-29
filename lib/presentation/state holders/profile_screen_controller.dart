import 'dart:developer';

import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/models/profile.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utility/urls.dart';
import 'package:get/get.dart';

class ProfileScreenController extends GetxController {
  bool _getProfileScreenInProgress = false;

  String _errorMessage = '';
  Profile _profile = Profile();
  bool get getProfileScreenInProgress => _getProfileScreenInProgress;
  String get errorMessage => _errorMessage;
  Profile get profile => _profile;
  Future<bool> getProfileData() async {
    _getProfileScreenInProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.getRequest(Urls.getProfile);

    if (response.isSuccess) {
      _getProfileScreenInProgress = false;
      update();
      _profile = Profile.fromJson(response.jsonResponse ?? {});
      log(response.toString());
      log(response.jsonResponse.toString());
      // print(_profile.firstName);

      return true;
    } else {
      _getProfileScreenInProgress = false;
      _errorMessage = 'Failed to get profile data!';
      update();
      return false;
    }
  }
}
