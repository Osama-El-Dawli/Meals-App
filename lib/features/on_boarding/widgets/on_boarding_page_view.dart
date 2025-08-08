import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/features/on_boarding/models/on_boarding_model.dart';
import 'package:meals_app/features/on_boarding/widgets/on_boarding_page_view_item.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, this.controller});
  final PageController? controller;

  static const List<OnBoardingModel> items = [
    OnBoardingModel(
      title: 'Save Your Meals Ingredient',
      subtitle:
          'Add Your Meals and its Ingredients and we will save it for you',
    ),
    OnBoardingModel(
      title: 'Use Our AppThe Best Choice',
      subtitle: 'the best choice for your kitchen do not hesitate',
    ),
    OnBoardingModel(
      title: 'Our AppYour Ultimate Choice',
      subtitle:
          'All the best restaurants and their top menus are ready for you',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ExpandablePageView.builder(
      controller: controller,
      itemBuilder: (context, index) {
        return OnBoardingPageViewItem(itemModel: items[index]);
      },
      itemCount: items.length,
    );
  }
}
