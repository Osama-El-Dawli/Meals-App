import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meals_app/core/utils/app_assets.dart';
import 'package:meals_app/core/utils/app_colors.dart';
import 'package:meals_app/features/home/screens/add_meal_screen.dart';
import 'package:meals_app/features/home/screens/home_screen.dart';
import 'package:meals_app/features/home/screens/profile_screen.dart';

class HomeLayout extends StatefulWidget {
  const HomeLayout({super.key});

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final screens = [
      HomeScreen(),
      AddMealScreen(
        onMealAdded: () {
          setState(() {
            currentIndex = 0;
          });
        },
      ),
      ProfileScreen(),
    ];
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: currentIndex,
        selectedItemColor: AppColors.primaryColor,
        items: [
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              Assets.iconsHome,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            icon: SvgPicture.asset(Assets.iconsHome),
            label: 'Home'.tr(),
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              Assets.iconsAdd,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            icon: SvgPicture.asset(Assets.iconsAdd),
            label: 'Add Meal'.tr(),
          ),
          BottomNavigationBarItem(
            activeIcon: SvgPicture.asset(
              Assets.iconsProfile,
              colorFilter: ColorFilter.mode(
                AppColors.primaryColor,
                BlendMode.srcIn,
              ),
            ),
            icon: SvgPicture.asset(Assets.iconsProfile),
            label: 'Profile'.tr(),
          ),
        ],
        onTap: (index) {
          currentIndex = index;
          setState(() {});
        },
      ),
    );
  }
}
