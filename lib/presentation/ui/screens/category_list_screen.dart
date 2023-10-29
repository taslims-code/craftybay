import 'package:ecommerce/presentation/state%20holders/category_controller.dart';
import 'package:ecommerce/presentation/state%20holders/main_bottom_nav_controller.dart';
import 'package:ecommerce/presentation/ui/screens/product_list_screen.dart';
import 'package:ecommerce/presentation/ui/widgets/category_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.black),
        ),
        elevation: 0,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Get.find<MainBottomNavController>().backToHome();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: GetBuilder<CategoriesController>(builder: (categoryController) {
          return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: categoryController.categoryModel.data?.length ?? 0,
              itemBuilder: (context, index) {
                return FittedBox(
                  child: CategoryCard(
                    categoryData: categoryController.categoryModel.data![index],
                    onTap: () {
                      Get.to(ProductListScreen(
                          categoryId: categoryController
                              .categoryModel.data![index].id!));
                    },
                  ),
                );
              });
        }),
      ),
    );
  }
}
