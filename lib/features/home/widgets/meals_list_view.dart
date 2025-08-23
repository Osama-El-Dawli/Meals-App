import 'package:flutter/material.dart';
import 'package:meals_app/core/helper/database_helper.dart';
import 'package:meals_app/features/home/models/meal_model.dart';
import 'package:meals_app/features/home/widgets/meals_list_view_item.dart';

class MealsListView extends StatefulWidget {
  const MealsListView({super.key});

  @override
  State<MealsListView> createState() => _MealsListViewState();
}

class _MealsListViewState extends State<MealsListView> {
  List<MealModel> meals = [];

  @override
  void initState() {
    _loadMeals();
    super.initState();
  }

  Future<void> _loadMeals() async {
    final data = await DatabaseHelper.getMeals();
    setState(() {
      meals = data.map((e) => MealModel.fromJson(e)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: meals.length,
      itemBuilder: (context, index) {
        return MealsListViewItem(mealModel: meals[index]);
      },
    );
  }
}
