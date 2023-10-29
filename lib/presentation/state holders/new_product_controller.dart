import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/models/product_model.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utility/urls.dart';
import 'package:get/get.dart';

class NewProductController extends GetxController {
  bool _newProductInProgress = false;
  String _errorMessage = '';

  ProductModel _newProductModel = ProductModel();

  bool get newProductInProgress => _newProductInProgress;

  String get errorMessage => _errorMessage;

  ProductModel get newProductModel => _newProductModel;

  Future<bool> getNewProductList() async {
    _newProductInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getProductByRemark('new'));

    if (response.isSuccess) {
      _newProductInProgress = false;

      _newProductModel = ProductModel.fromJson(response.jsonResponse ?? {});
      // print("getNew product ${_newProductModel.data![0].id}");
      update();

      return true;
    } else {
      _newProductInProgress = false;

      _errorMessage = 'Failed to fetch new product';
      update();
      return false;
    }
  }
}
