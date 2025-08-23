import 'package:flutter/material.dart';
import 'package:meals_app/core/utils/app_colors.dart';
import 'package:meals_app/features/home/models/meal_model.dart';

class MealsListViewItem extends StatelessWidget {
  const MealsListViewItem({super.key, required this.mealModel});
  final MealModel mealModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.network(mealModel.imageUrl),
      ),
      title: Text(
        mealModel.name,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        mealModel.description,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: AppColors.primaryColor,
        ),
      ),
    );
  }
}
