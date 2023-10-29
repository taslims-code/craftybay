import 'package:ecommerce/presentation/state%20holders/add_to_cart_controller.dart';
import 'package:ecommerce/presentation/state%20holders/category_controller.dart';
import 'package:ecommerce/presentation/state%20holders/complete_profile_controller.dart';
import 'package:ecommerce/presentation/state%20holders/email_verification_controller.dart';
import 'package:ecommerce/presentation/state%20holders/home_slider_controller.dart';
import 'package:ecommerce/presentation/state%20holders/new_product_controller.dart';
import 'package:ecommerce/presentation/state%20holders/otp_timer_controller.dart';
import 'package:ecommerce/presentation/state%20holders/otp_verification_controller.dart';
import 'package:ecommerce/presentation/state%20holders/popular_product_controller.dart';
import 'package:ecommerce/presentation/state%20holders/product_details_controller.dart';
import 'package:ecommerce/presentation/state%20holders/product_list_controller.dart';
import 'package:ecommerce/presentation/state%20holders/profile_screen_controller.dart';
import 'package:ecommerce/presentation/state%20holders/review_controller.dart';
import 'package:ecommerce/presentation/state%20holders/special_product_controller.dart';
import 'package:get/get.dart';

import '../presentation/state holders/auth_controller.dart';
import '../presentation/state holders/main_bottom_nav_controller.dart';

class StateHolderBinders extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(EmailVerificationController());
    Get.put(MainBottomNavController());
    Get.put(OtpTimerController());
    Get.put(OtpVerificationController());
    Get.put(HomeSliderController());
    Get.put(CategoriesController());
    Get.put(PopularProductController());
    Get.put(SpecialProductController());
    Get.put(NewProductController());
    Get.put(ProductDetailsController());
    Get.put(ReviewController());
    Get.put(ProductListController());
    Get.put(AddToCartController());
    Get.put(ProfileScreenController());
    Get.put(CompleteProfileController());
  }
}
