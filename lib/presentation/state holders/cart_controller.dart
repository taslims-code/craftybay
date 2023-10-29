import 'package:ecommerce/data/models/cart.dart';
import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utility/urls.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  bool _getCartInProgress = false;

  String _errorMessage = '';

  Cart _cartModel = Cart();

  String get errorMessage => _errorMessage;
  Cart get cartModel => _cartModel;
  bool get getCategoryInProgress => _getCartInProgress;

  Future<bool> getCategories() async {
    _getCartInProgress = true;

    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getCart);

    if (response.isSuccess) {
      _getCartInProgress = false;

      // _cartModel = CategoryModel.fromJson(response.jsonResponse ?? {});

      _cartModel = Cart.fromJson(response.jsonResponse ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'Failed to fetch Cart data!';
      _getCartInProgress = false;
      update();
      return false;
    }
  }
}
