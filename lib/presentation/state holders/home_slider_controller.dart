import 'package:ecommerce/data/models/network_response.dart';
import 'package:ecommerce/data/services/network_caller.dart';
import 'package:ecommerce/data/utility/urls.dart';
import 'package:get/get.dart';

import '../../data/models/slider_model.dart';

class HomeSliderController extends GetxController {
  bool _getHomeSliderInProgress = false;
  SliderModel _sliderModel = SliderModel();

  String _errorMessage = '';

  bool get getHomeSliderInProgress => _getHomeSliderInProgress;

  SliderModel get sliderModel => _sliderModel;

  String get errorMessage => _errorMessage;

  Future<bool> getHomeSliders() async {
    _getHomeSliderInProgress = true;
    update();

    final NetworkResponse response =
        await NetworkCaller.getRequest(Urls.getHomeSliders);
    if (response.isSuccess) {
      _getHomeSliderInProgress = false;
      _sliderModel = SliderModel.fromJson(response.jsonResponse ?? {});
      update();
      return true;
    } else {
      _errorMessage = 'Sliders data fetch failed!';
      update();
      return false;
    }
  }
}
