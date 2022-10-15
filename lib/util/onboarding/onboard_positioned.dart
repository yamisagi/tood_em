import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:tood_em/util/onboarding/onboarding_button.dart';

class OnBoardPositioned extends StatelessWidget {
  const OnBoardPositioned({
    Key? key,
    required this.isFirstPage,
    required PageController pageController,
    required this.isLastPage,
  })  : _pageController = pageController,
        super(key: key);

  final bool isFirstPage;
  final PageController _pageController;
  final bool isLastPage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: MediaQuery.of(context).size.width / 4,
      child: SizedBox(
        height: 50,
        // MediaQuery.textScaleFactorOf(context) * 200,
        width: MediaQuery.textScaleFactorOf(context) * 280,
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isFirstPage
                ? OnBoardingButton(
                    onPressed: () {
                      _pageController.animateToPage(2,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut);
                    },
                    text: 'Atla')
                : OnBoardingButton(
                    onPressed: () {
                      _pageController.previousPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut);
                    },
                    text: 'Geri',
                  ),
            SmoothPageIndicator(
              onDotClicked: (index) => _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              ),
              controller: _pageController,
              count: 3,
              effect: const ExpandingDotsEffect(
                dotHeight: 10,
                dotWidth: 10,
                dotColor: Colors.white,
                activeDotColor: Colors.white,
              ),
            ),
            isLastPage
                ? OnBoardingButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                    text: 'Başlayalım',
                  )
                : OnBoardingButton(
                    text: 'Sonraki',
                    onPressed: () => _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
