import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/models/product_details.dart';
import 'package:ecommerce/data/models/product_details_model.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utility/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController {
  bool _getProductDetailsInProgress = false;
  ProductDetails _productDetails = ProductDetails();
  String _errorMessage = '';
  final List<String> _availableColors = [];
  final List<String> _availableSizes = [];

  List<String> get availableSizes => _availableSizes;

  bool get getProductDetailsInProgress => _getProductDetailsInProgress;

  ProductDetails get productDetails => _productDetails;

  List<String> get availableColors => _availableColors;

  String get errorMessage => _errorMessage;

  Future<bool> getProductDetails(int id) async {
    _getProductDetailsInProgress = true;
    update();
    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getProductDetailsById(id));
    _getProductDetailsInProgress = false;
    if (response.isSuccess) {
      _productDetails =
          (ProductDetailsModel.fromJson(response.jsonResponse ?? {}))
              .data
              .first;
      _convertStringToColor(_productDetails.color ?? '');
      _convertStringToSize(_productDetails.size ?? '');
      update();
      return true;
    } else {
      _errorMessage = 'Fetch product details has been failed! Try again.';
      update();
      return false;
    }
  }

  void _convertStringToColor(String color) {
    _availableColors.clear();
    final List<String> splitColors = color.split(',');
    for (String c in splitColors) {
      if (c.isNotEmpty) {
        _availableColors.add(c);
      }
    }
  }

  void _convertStringToSize(String size) {
    _availableSizes.clear();
    final List<String> splitSizes = size.split(',');
    for (String s in splitSizes) {
      if (s.isNotEmpty) {
        _availableSizes.add(s);
      }
    }
  }
}
