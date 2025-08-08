import 'package:dots_indicator/dots_indicator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/features/on_boarding/widgets/on_boarding_page_view.dart';

class OnBoardingItem extends StatefulWidget {
  const OnBoardingItem({super.key});

  @override
  State<OnBoardingItem> createState() => _OnBoardingItemState();
}

class _OnBoardingItemState extends State<OnBoardingItem> {
  double currentIndex = 0;
  final PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        currentIndex = _controller.page ?? 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        OnBoardingPageView(controller: _controller),
        SizedBox(height: 36),
        DotsIndicator(
          onTap: (index) {
            _controller.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.easeIn,
            );
          },
          position: currentIndex,
          dotsCount: OnBoardingPageView.items.length,
          decorator: DotsDecorator(
            shape: RoundedRectangleBorder(),
            spacing: EdgeInsets.symmetric(horizontal: 2),
            activeShape: RoundedRectangleBorder(),
            activeColor: Colors.white,
            color: Color(0xffC2C2C2),
            size: Size(24, 6),
            activeSize: Size(24, 6),
          ),
        ),
        if (currentIndex == OnBoardingPageView.items.length - 1) ...[
          SizedBox(height: 46),
          IconButton(
            onPressed: () {},
            icon: Icon(
              context.locale.languageCode == 'en'
                  ? Icons.arrow_circle_right_rounded
                  : Icons.arrow_circle_left_rounded,
              color: Colors.white,
              size: 84,
            ),
          ),
        ] else ...[
          SizedBox(height: 98),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'Skip',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ).tr(),
              ),
              TextButton(
                onPressed: () {
                  _controller.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: Text(
                  'Next',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ).tr(),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
