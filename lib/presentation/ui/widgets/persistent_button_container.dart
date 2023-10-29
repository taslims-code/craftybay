import 'package:ecommerce/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

class PersistentContainer extends StatelessWidget {
  const PersistentContainer({
    super.key,
    required this.onPressed,
    this.icon,
    required this.isVertical,
    required this.firstText,
    required this.secondText,
    this.buttonText,
  });

  final VoidCallback onPressed;

  final IconData? icon;
  final bool isVertical;
  final String firstText;
  final String secondText;
  final String? buttonText;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.primaryColor.withOpacity(0.1),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          isVertical == true
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      firstText,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black54),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Text(
                      secondText,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: AppColors.primaryColor),
                    ),
                  ],
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      firstText,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black54),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      secondText,
                      style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: Colors.black54),
                    ),
                  ],
                ),
          isVertical == true
              ? SizedBox(
                  width: 120,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    child: Text(buttonText!),
                  ),
                )
              : Container(
                  decoration: const BoxDecoration(
                    color: AppColors.primaryColor,
                    shape: BoxShape.circle,
                  ),
                  // width: 120,
                  child: IconButton(
                    onPressed: onPressed,
                    icon: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
                )
        ],
      ),
    );
  }
}
