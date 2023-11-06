import 'package:ecommerce/presentation/state%20holders/category_controller.dart';
import 'package:ecommerce/presentation/state%20holders/home_slider_controller.dart';
import 'package:ecommerce/presentation/state%20holders/main_bottom_nav_controller.dart';
import 'package:ecommerce/presentation/state%20holders/new_product_controller.dart';
import 'package:ecommerce/presentation/state%20holders/popular_product_controller.dart';
import 'package:ecommerce/presentation/state%20holders/special_product_controller.dart';
import 'package:ecommerce/presentation/ui/screens/product_list_screen.dart';
import 'package:ecommerce/presentation/ui/utility/image_assets.dart';
import 'package:ecommerce/presentation/ui/widgets/circular_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgets/category_card.dart';
import '../widgets/home_slider.dart';
import '../widgets/product_card.dart';
import '../widgets/section_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset(
              ImageAssets.craftyBayNavLogoSVG,
            ),
            const Spacer(),
            CircularIconButton(
              icon: Icons.light_mode_outlined,
              onTap: () {
                // themeModeController.toggleThemeMode();
                if (Get.isDarkMode) {
                  Get.changeThemeMode(ThemeMode.light);
                } else {
                  Get.changeThemeMode(ThemeMode.dark);
                }
              },
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              icon: Icons.person,
              onTap: () {
                // Get.to(() => const ProfileScreen());
              },
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              icon: Icons.call,
              onTap: () {},
            ),
            const SizedBox(
              width: 8,
            ),
            CircularIconButton(
              icon: Icons.notifications_none,
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search',
                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                  focusedBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                  enabledBorder:
                      const OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              GetBuilder<HomeSliderController>(builder: (homeSliderController) {
                if (homeSliderController.getHomeSliderInProgress) {
                  return const SizedBox(
                    height: 180.0,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
                return HomeSlider(
                  sliders: homeSliderController.sliderModel.data ?? [],
                );
              }),
              SectionHeader(
                title: 'Categories',
                onTap: () {
                  Get.find<MainBottomNavController>().changeScreen(1);
                },
              ),
              const SizedBox(
                height: 8,
              ),
              GetBuilder<CategoriesController>(builder: (categoryController) {
                return SizedBox(
                  height: 90,
                  child: ListView.builder(
                    itemCount:
                        categoryController.categoryModel.data?.length ?? 0,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return FittedBox(
                        child: CategoryCard(
                          categoryData:
                              categoryController.categoryModel.data![index],
                          onTap: () {
                            Get.to(ProductListScreen(
                                categoryId: categoryController
                                    .categoryModel.data![index].id!));
                          },
                        ),
                      );
                    },
                  ),
                );
              }),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(
                title: 'Popular',
                onTap: () {
                  Get.to(ProductListScreen(
                    productModel: Get.find<PopularProductController>()
                        .popularProductModel,
                  ));
                },
              ),
              GetBuilder<PopularProductController>(
                  builder: (popularProductController) {
                return SizedBox(
                  height: 165,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: popularProductController
                            .popularProductModel.data?.length ??
                        0,
                    itemBuilder: (context, index) {
                      if (popularProductController
                          .getPopularProductInProgress) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return ProductCard(
                        productData: popularProductController
                            .popularProductModel.data![index],
                      );
                    },
                  ),
                );
              }),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(
                title: 'Special',
                onTap: () {
                  Get.to(ProductListScreen(
                    productModel: Get.find<SpecialProductController>()
                        .specialProductModel,
                  ));
                },
              ),
              GetBuilder<SpecialProductController>(
                  builder: (specialProductController) {
                return SizedBox(
                  height: 165,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: specialProductController
                            .specialProductModel.data?.length ??
                        0,
                    itemBuilder: (context, index) {
                      // return null;

                      return ProductCard(
                        productData: specialProductController
                            .specialProductModel.data![index],
                      );
                    },
                  ),
                );
              }),
              const SizedBox(
                height: 16,
              ),
              SectionHeader(
                title: 'New',
                onTap: () {
                  Get.to(ProductListScreen(
                    productModel:
                        Get.find<NewProductController>().newProductModel,
                  ));
                },
              ),
              GetBuilder<NewProductController>(builder: (newProductController) {
                return SizedBox(
                  height: 165,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        newProductController.newProductModel.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      // return null;

                      return ProductCard(
                        productData:
                            newProductController.newProductModel.data![index],
                      );
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
