import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utility/urls.dart';
import 'package:get/get.dart';

class SpecialProductController extends GetxController {
  bool _specialProductInProgress = false;
  String _errorMessage = '';

  ProductModel _specialProductModel = ProductModel();

  bool get specialProductInProgress => _specialProductInProgress;

  String get errorMessage => _errorMessage;

  ProductModel get specialProductModel => _specialProductModel;

  Future<bool> getSpecialProductList() async {
    _specialProductInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getProductByRemark('special'));

    if (response.isSuccess) {
      _specialProductInProgress = false;

      _specialProductModel = ProductModel.fromJson(response.jsonResponse ?? {});

      // print("getSpecial product id ${_specialProductModel.data![0].id}");
      // print("getSpecial product  ${_specialProductModel.data![0].id}");

      update();

      return true;
    } else {
      _specialProductInProgress = false;

      _errorMessage = 'Failed to fetch special product';
      update();
      return false;
    }
  }
}
