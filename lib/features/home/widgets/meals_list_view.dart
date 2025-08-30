import 'package:flutter/material.dart';
import 'package:meals_app/core/helper/database_helper.dart';
import 'package:meals_app/features/home/models/meal_model.dart';
import 'package:meals_app/features/home/screens/meal_details_screen.dart';
import 'package:meals_app/features/home/widgets/meals_list_view_item.dart';

class MealsListView extends StatelessWidget {
  const MealsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
      future: DatabaseHelper.getMeals(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error.toString()}'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('No Meals Found'));
        } else {
          final List<MealModel> meals = snapshot.data!
              .map((e) => MealModel.fromJson(e))
              .toList();
          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MealDetailsScreen(mealModel: meals[index]),
                  ),
                ),
                child: MealsListViewItem(mealModel: meals[index]),
              );
            },
          );
        }
      },
    );
  }
}
