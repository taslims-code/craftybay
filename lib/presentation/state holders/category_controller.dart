import 'package:ecommerce/data/models/category_model.dart';
import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utility/urls.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  bool _getCategoryInProgress = false;

  String _errorMessage = '';

  CategoryModel _categoryModel = CategoryModel();

  String get errorMessage => _errorMessage;
  CategoryModel get categoryModel => _categoryModel;
  bool get getCategoryInProgress => _getCategoryInProgress;

  Future<bool> getCategories() async {
    _getCategoryInProgress = true;

    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getCategory);

    if (response.isSuccess) {
      _getCategoryInProgress = false;

      _categoryModel = CategoryModel.fromJson(response.jsonResponse ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'Failed to fetch Categories!';
      _getCategoryInProgress = false;
      update();
      return false;
    }
  }
}
