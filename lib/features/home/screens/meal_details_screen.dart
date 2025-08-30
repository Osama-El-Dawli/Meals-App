import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/core/utils/app_colors.dart';
import 'package:meals_app/features/home/models/meal_model.dart';
import 'package:shimmer/shimmer.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.mealModel});
  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Meal Details'.tr(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 220,
            child: CachedNetworkImage(
              imageUrl: mealModel.imageUrl,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Container(
                width: double.infinity,
                height: 220,
                decoration: BoxDecoration(color: AppColors.primaryColor),
                child: Icon(Icons.broken_image, color: Colors.white, size: 54),
              ),
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  width: double.infinity,
                  height: 220,
                  decoration: BoxDecoration(color: Colors.grey.shade300),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mealModel.name,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withValues(alpha: 0.04),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.alarm, color: AppColors.primaryColor),
                      const SizedBox(width: 8),
                      Text(
                        mealModel.time,
                        style: TextStyle(color: Color(0xff878787)),
                      ),
                      const Spacer(),
                      Icon(Icons.star, color: AppColors.primaryColor),
                      const SizedBox(width: 8),
                      Text(
                        mealModel.rate.toString(),
                        style: TextStyle(color: Color(0xff878787)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                Text(mealModel.description, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
