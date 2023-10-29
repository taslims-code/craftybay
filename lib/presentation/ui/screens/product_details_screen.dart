import 'package:ecommerce/data/models/product_details.dart';
import 'package:ecommerce/presentation/state%20holders/add_to_cart_controller.dart';
import 'package:ecommerce/presentation/state%20holders/product_details_controller.dart';
import 'package:ecommerce/presentation/ui/screens/reviews/reviews.dart';
import 'package:ecommerce/presentation/ui/utility/app_colors.dart';
import 'package:ecommerce/presentation/ui/widgets/custom_stepper.dart';
import 'package:ecommerce/presentation/ui/widgets/persistent_button_container.dart';
import 'package:ecommerce/presentation/ui/widgets/product_image_slider.dart';
import 'package:ecommerce/presentation/ui/widgets/size_selector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  final int productId;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  List<String> colors = [];
  List<String> sizes = [];
  int _selectedColorIndex = 0;

  int _selectedSizeIndex = 0;
  int quantity = 1;
  ProductDetailsController productDetailsController =
      Get.find<ProductDetailsController>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ProductDetailsController>().getProductDetails(widget.productId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductDetailsController>(
          builder: (productDetailsController) {
        if (productDetailsController.getProductDetailsInProgress) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ProductImageSlider(
                            imgList: [
                              productDetailsController.productDetails.img1 ??
                                  '',
                              productDetailsController.productDetails.img2 ??
                                  '',
                              productDetailsController.productDetails.img3 ??
                                  '',
                              productDetailsController.productDetails.img4 ??
                                  '',
                            ],
                          ),
                          productDetailsAppBar,
                        ],
                      ),
                      /*productDetails(productDetailsController.productDetails,

                          productDetailsController.availableColors),*/

                      productDetails(
                          productDetailsController.productDetails,
                          productDetailsController.availableColors,
                          productDetailsController.availableSizes),
                    ],
                  ),
                ),
              ),
              PersistentContainer(
                onPressed: () {
                  Get.find<AddToCartController>().addToCart(
                    productDetailsController.productDetails.id!,
                    productDetailsController
                        .availableColors[_selectedColorIndex],
                    productDetailsController.availableSizes[_selectedSizeIndex],
                    quantity,
                  );
                },
                isVertical: true,
                firstText: 'Price',
                secondText: '\$1000',
                // icon: Icons.add,
                buttonText: 'Add to Cart',
              ),
            ],
          ),
        );
      }),
    );
  }

  AppBar get productDetailsAppBar {
    return AppBar(
      leading: const BackButton(
        color: Colors.black54,
      ),
      title: const Text(
        'Product details',
        style: TextStyle(color: Colors.black54),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Padding productDetails(
      ProductDetails productDetails, List<String> colors, List<String> sizes) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Text(
                productDetails.product?.title ?? '',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.5),
              )),
              CustomStepper(
                  lowerLimit: 1,
                  upperLimit: 10,
                  stepValue: 1,
                  value: 1,
                  onChange: (newValue) {
                    quantity = newValue;
                    if (kDebugMode) {
                      print(newValue);
                    }
                  })
            ],
          ),
          Row(
            children: [
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  const Icon(
                    Icons.star,
                    size: 18,
                    color: Colors.amber,
                  ),
                  Text(
                    '${productDetails.product?.star ?? 0}',
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueGrey),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => ReviewsScreen(
                        productId: widget.productId,
                      ));
                },
                child: const Text(
                  'Review',
                  style: TextStyle(
                      fontSize: 15,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Card(
                color: AppColors.primaryColor,
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Icon(
                    Icons.favorite_border,
                    size: 16,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          const Text(
            'Color',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          SizeSelector(
            // sizes: Get.find<ProductDetailsController>().availableSizes,
            sizes:
                productDetailsController.productDetails.color?.split(',') ?? [],
            initialSelected: 0,
            onSelected: (int selectedIndex) {
              _selectedColorIndex = selectedIndex;
            },
            // sizes: productDetails.size,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Size',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          SizeSelector(
            // sizes: Get.find<ProductDetailsController>().availableSizes,
            sizes:
                productDetailsController.productDetails.size?.split(',') ?? [],
            initialSelected: 0,
            onSelected: (int selectedIndex) {
              _selectedSizeIndex = selectedIndex;
            },
            // sizes: productDetails.size,
          ),
          const SizedBox(
            height: 16,
          ),
          const Text(
            'Description',
            style: TextStyle(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(productDetails.des ?? ''),
        ],
      ),
    );
  }

  void colorTap(int index) {
    _selectedColorIndex = index;
    if (mounted) {
      setState(() {});
    }
  }
}
