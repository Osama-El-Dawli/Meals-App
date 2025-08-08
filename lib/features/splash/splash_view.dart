import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meals_app/core/utils/app_assets.dart';
import 'package:meals_app/features/on_boarding/on_boarding_view.dart';
import 'package:flutter/scheduler.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Duration? _animationDuration;

  void _navigateAfterAnimation() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const OnBoardingView()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: LottieBuilder.asset(
          Assets.animationsSplash,
          repeat: false,
          onLoaded: (composition) {
            _animationDuration = composition.duration;
            SchedulerBinding.instance.addPostFrameCallback((_) {
              Future.delayed(_animationDuration!, _navigateAfterAnimation);
            });
          },
        ),
      ),
    );
  }
}
