import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:meals_app/core/helper/cache_helper.dart';
import 'package:meals_app/core/helper/database_helper.dart';
import 'package:meals_app/core/services/service_locator.dart';
import 'package:meals_app/features/home/models/meal_model.dart';
import 'package:meals_app/features/splash/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await setupServiceLocator();
  await getIt<CacheHelper>().init();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      fallbackLocale: const Locale('en'),
      path: 'assets/translation',
      child: const MealsApp(),
    ),
  );
}

class MealsApp extends StatelessWidget {
  const MealsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: SplashView(),
    );
  }
}
