import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utility/urls.dart';
import 'package:get/get.dart';

class CompleteProfileController extends GetxController {
  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Future<bool> postCompleteProfile(
    String name,
    String country,
    String state,
    String city,
    String postCode,
    String mobile,
    String address,
  ) async {
    NetworkResponse response = await NetworkCaller.postRequest(
      Urls.postCompleteProfile,
      {
        "cus_name": name,
        "cus_city": city,
        "cus_state": state,
        "cus_postcode": postCode,
        "cus_country": country,
        "cus_phone": mobile,
        "cus_add": address,
        "cus_fax": mobile,
        "ship_name": name,
        "ship_add": address,
        "ship_city": city,
        "ship_state": state,
        "ship_postcode": postCode,
        "ship_country": country,
        "ship_phone": mobile,
      },
    );

    if (response.isSuccess) {
      return true;
    } else {
      _errorMessage = 'Profile failed to update!';
      return false;
    }
  }
}
