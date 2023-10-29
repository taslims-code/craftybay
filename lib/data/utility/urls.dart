class Urls {
  static const String _baseUrl = 'https://ecom-api.teamrabbil.com/api';

  static String verifyEmail(String email) => '$_baseUrl/UserLogin/$email';

  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';
  static String getHomeSliders = '$_baseUrl/ListProductSlider';
  static String getCategory = '$_baseUrl/CategoryList';
  static String getProductByRemark(String remark) =>
      '$_baseUrl/ListProductByRemark/$remark';
  static String getProductDetailsById(int productId) =>
      '$_baseUrl/ProductDetailsById/$productId';
  static String getProductReviewById(int productId) =>
      '$_baseUrl/ListReviewByProduct/$productId';
  static String getProductByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';
  static String postCompleteProfile = '$_baseUrl/CreateProfile';
  static String addToCart = '$_baseUrl/CreateCartList';
  static String getProfile = '$_baseUrl/ReadProfile';
  static String getWishList = '$_baseUrl/ProductWishList/';
  static String getCart = '$_baseUrl/CartList';
}
