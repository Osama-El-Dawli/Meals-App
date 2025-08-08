import 'package:flutter/material.dart';
import 'package:meals_app/core/utils/app_assets.dart';
import 'package:meals_app/core/utils/app_colors.dart';
import 'package:meals_app/features/on_boarding/widgets/on_boarding_item.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(Assets.imagesBackground, fit: BoxFit.cover),
          ),
          Positioned(
            bottom: 40,
            right: 32,
            left: 32,
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withValues(alpha: 0.9),
                borderRadius: BorderRadius.circular(48),
              ),
              child: OnBoardingItem(),
            ),
          ),
        ],
      ),
    );
  }
}
