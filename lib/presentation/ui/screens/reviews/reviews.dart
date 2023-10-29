import 'package:ecommerce/presentation/state%20holders/review_controller.dart';
import 'package:ecommerce/presentation/ui/screens/reviews/add_new_review.dart';
import 'package:ecommerce/presentation/ui/widgets/persistent_button_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/review_card.dart';

class ReviewsScreen extends StatefulWidget {
  final int productId;
  const ReviewsScreen({super.key, required this.productId});

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  final reviewController = Get.find<ReviewController>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      reviewController.getReview(widget.productId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Reviews'),
        elevation: .5,
      ),
      body: reviewController.getReviewInProgress
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  child: GetBuilder<ReviewController>(builder: (_) {
                    /*  if (reviewController.getReviewInProgress) {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }*/
                    return SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: reviewController.review.data?.length ?? 0,
                          itemBuilder: (context, index) {
                            return ReviewCard(
                              name: reviewController
                                      .review.data?[index].profile?.firstName ??
                                  'No Data',
                              comment: reviewController
                                      .review.data?[index].description ??
                                  'No Data',
                            );
                          },
                        ),
                      ),
                    );
                  }),
                ),
                PersistentContainer(
                  isVertical: false,
                  onPressed: () {
                    Get.to(() => AddReview());
                  },
                  icon: Icons.add,
                  firstText: 'Reviews',
                  secondText: '(1000)',
                  buttonText: 'Add to cart',
                ),
              ],
            ),
    );
  }
}
