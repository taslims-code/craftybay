import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/models/review_model.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utility/urls.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController {
  bool _getReviewInProgress = false;

  ReviewModel _review = ReviewModel();
  String _errorMessage = '';

  bool get getReviewInProgress => _getReviewInProgress;

  ReviewModel get review => _review;

  String get errorMessage => _errorMessage;

  Future<bool> getReview(int id) async {
    _getReviewInProgress = true;

    NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getProductReviewById(id));

    if (response.isSuccess) {
      _review = ReviewModel.fromJson(response.jsonResponse ?? {});
      _getReviewInProgress = false;
      update();
      return true;
    } else {
      _errorMessage = 'Review fetch failed!';
      _getReviewInProgress = false;
      update();
      return false;
    }
  }
}
