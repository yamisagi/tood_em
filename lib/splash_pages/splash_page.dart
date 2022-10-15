import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tood_em/constant/const.dart';
import 'package:tood_em/constant/text_style.dart';

class SplashPage extends StatelessWidget {
  final String assetName;
  final String title;
  final String subTitle;
  const SplashPage(
      {Key? key,
      required this.assetName,
      required this.title,
      required this.subTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 4),
              height: MediaQuery.of(context).size.height / 3,
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Lottie.asset(
                // asseName here
                'assets/lottie/$assetName.json',
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Text(
                // Text 1 here
                title,
                style: ProductTextSyle.onboardStyle,
              ),
              const SizedBox(height: 10),
              SizedBox(
                //Text 2 here
                width: MediaQuery.of(context).size.width * 0.8,
                child: Text(subTitle,
                    textAlign: TextAlign.center,
                    style: ProductTextSyle.onBoardSubtitle),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
