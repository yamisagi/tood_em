import 'package:flutter/material.dart';

import 'package:tood_em/util/onboarding/onboard_positioned.dart';
import '../splash_pages/splash_page.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();
  bool isLastPage = false;
  bool isFirstPage = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        PageView(
          allowImplicitScrolling: true,
          onPageChanged: (value) {
            if (value == 0) {
              setState(() {
                isFirstPage = true;
              });
            } else {
              setState(() {
                isFirstPage = false;
              });
            }
            setState(() {
              isLastPage = value == 2;
            });
          },
          controller: _pageController,
          children: const [
            SplashPage(
              assetName: 'idea',
              title: 'Tood\'em\'e hoşgeldiniz',
              subTitle:
                  'Günlük görevlerinizi takip etmenize yardımcı olan basit ve kullanımı kolay bir görev yöneticisi',
            ),
            SplashPage(
              assetName: 'task',
              title: 'Görevlerinizi ekleyin',
              subTitle:
                  'Görevlerinizi ekleyin ve işiniz bittiğinde tamamlandı olarak işaretleyin',
            ),
            SplashPage(
              assetName: 'start',
              title: 'Hadi Başlayalım',
              subTitle:
                  'Tood\'em\'i kullanmaya başlamak için aşağıdaki düğmeyi tıklayın :)',
            ),
          ],
        ),
        OnBoardPositioned(
            isFirstPage: isFirstPage,
            pageController: _pageController,
            isLastPage: isLastPage),
      ]),
    );
  }
}
