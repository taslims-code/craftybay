import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utility/urls.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController {
  bool _emailVerificationOnGoing = false;
  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  bool get emailVerificationOnGoing => _emailVerificationOnGoing;

  Future<bool> verifyEmail(String email) async {
    _emailVerificationOnGoing = true;
    update();

    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.verifyEmail(email));

    if (response.isSuccess) {
      _emailVerificationOnGoing = false;
      _errorMessage = response.jsonResponse?['data'] ?? '';
      update();
      return true;
    } else {
      _emailVerificationOnGoing = false;
      update();
      return false;
    }
  }
}
