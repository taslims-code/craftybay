import 'package:ecommerce/presentation/state%20holders/category_controller.dart';
import 'package:ecommerce/presentation/state%20holders/home_slider_controller.dart';
import 'package:ecommerce/presentation/state%20holders/main_bottom_nav_controller.dart';
import 'package:ecommerce/presentation/state%20holders/new_product_controller.dart';
import 'package:ecommerce/presentation/state%20holders/popular_product_controller.dart';
import 'package:ecommerce/presentation/state%20holders/special_product_controller.dart';
import 'package:ecommerce/presentation/ui/screens/cart_screen.dart';
import 'package:ecommerce/presentation/ui/screens/category_list_screen.dart';
import 'package:ecommerce/presentation/ui/screens/home_screen.dart';
import 'package:ecommerce/presentation/ui/screens/wish_list_screen.dart';
import 'package:ecommerce/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoryListScreen(),
    const CartScreen(),
    const WishListScreen(),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<HomeSliderController>().getHomeSliders();
      Get.find<CategoriesController>().getCategories();
      Get.find<PopularProductController>().getPopularProductList();
      Get.find<SpecialProductController>().getSpecialProductList();
      Get.find<NewProductController>().getNewProductList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(builder: (controller) {
      return Scaffold(
        body: _screens[controller.currentSelectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.currentSelectedIndex,
          onTap: controller.changeScreen,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Colors.grey,
          showUnselectedLabels: true,
          elevation: 4,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_filled,
                ),
                label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.dashboard,
                ),
                label: 'Categories'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                label: 'Cart'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite_border,
                ),
                label: 'Wishlist'),
          ],
        ),
      );
    });
  }
}
