import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utility/urls.dart';
import 'package:get/get.dart';

import '../../data/models/product_model.dart';

class PopularProductController extends GetxController {
  bool _getPopularProductInProgress = false;

  String _errorMessage = '';

  ProductModel _popularProductModel = ProductModel();

  bool get getPopularProductInProgress => _getPopularProductInProgress;

  String get errorMessage => _errorMessage;

  ProductModel get popularProductModel => _popularProductModel;

  Future<bool> getPopularProductList() async {
    _getPopularProductInProgress = true;

    update();

    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.getProductByRemark('popular'),
    );

    if (response.isSuccess) {
      _getPopularProductInProgress = false;

      _popularProductModel = ProductModel.fromJson(response.jsonResponse ?? {});
      // print("getPopular product ${_popularProductModel.data![0].id}");
      update();
      return true;
    } else {
      _getPopularProductInProgress = false;
      _errorMessage = 'Popular product list fetch failed!';
      update();
      return false;
    }
  }
}
