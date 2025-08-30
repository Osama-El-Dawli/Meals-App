import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/core/helper/database_helper.dart';
import 'package:meals_app/core/utils/app_colors.dart';
import 'package:meals_app/features/home/models/meal_model.dart';
import 'package:meals_app/features/home/widgets/add_meal_titled_text_field.dart';

class AddMealScreen extends StatefulWidget {
  const AddMealScreen({super.key, this.onMealAdded});
  final VoidCallback? onMealAdded;

  @override
  State<AddMealScreen> createState() => _AddMealScreenState();
}

class _AddMealScreenState extends State<AddMealScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();
  final TextEditingController caloriesController = TextEditingController();
  final TextEditingController rateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    imageUrlController.dispose();
    caloriesController.dispose();
    rateController.dispose();
    timeController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          'Add Meal'.tr(),
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 14),
                AddMealTitledTextField(
                  title: 'Meal Name'.tr(),
                  controller: nameController,
                ),
                const SizedBox(height: 12),
                AddMealTitledTextField(
                  title: 'Image URL'.tr(),
                  maxLines: 3,
                  controller: imageUrlController,
                ),
                const SizedBox(height: 12),
                AddMealTitledTextField(
                  title: 'Calories'.tr(),
                  keyboardType: TextInputType.number,
                  controller: caloriesController,
                ),
                const SizedBox(height: 12),
                AddMealTitledTextField(
                  title: 'Rate'.tr(),
                  keyboardType: TextInputType.number,
                  controller: rateController,
                ),
                const SizedBox(height: 12),
                AddMealTitledTextField(
                  title: 'Time'.tr(),
                  controller: timeController,
                ),
                const SizedBox(height: 12),
                AddMealTitledTextField(
                  title: 'Description'.tr(),
                  maxLines: 5,
                  controller: descriptionController,
                ),
                const SizedBox(height: 14),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        MealModel meal = MealModel(
                          name: nameController.text,
                          imageUrl: imageUrlController.text,
                          calories: int.parse(caloriesController.text),
                          rate: double.parse(rateController.text),
                          time: timeController.text,
                          description: descriptionController.text,
                        );
                        DatabaseHelper.insertMeal(meal).then((value) {
                          if (widget.onMealAdded != null) {
                            widget.onMealAdded!();
                          }
                        });
                        nameController.clear();
                        imageUrlController.clear();
                        caloriesController.clear();
                        rateController.clear();
                        timeController.clear();
                        descriptionController.clear();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    child: Text(
                      'Save'.tr(),
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
