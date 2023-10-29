import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utility/urls.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController {
  bool _getAddToCartInProgress = false;

  bool get getAddToCartInProgress => _getAddToCartInProgress;

  String _errorMessage = '';

  String get errorMessage => _errorMessage;

  Future<bool> addToCart(
      int productId, String color, String size, int quantity) async {
    _getAddToCartInProgress = true;
    update();
    NetworkResponse response = await NetworkCaller.postRequest(Urls.addToCart, {
      "product_id": productId,
      "color": color,
      "size": size,
      "qty": quantity,
    });
    _getAddToCartInProgress = false;
    update();

    if (response.isSuccess) {
      return true;
    } else {
      _errorMessage = 'Add to cart failed! Try again';
      return false;
    }
  }
}
