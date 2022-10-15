import 'package:flutter/material.dart';
import 'package:is_first_run/is_first_run.dart';
import 'package:lottie/lottie.dart';
import 'package:tood_em/pages/home_page.dart';
import 'package:tood_em/pages/onboard_page.dart';

Future<bool> isFirstRun() async {
  final isFirstRun = await IsFirstRun.isFirstRun();
  return isFirstRun;
}

Widget entryLogic() {
  return FutureBuilder(
    future: isFirstRun(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        if (snapshot.data == true) {
          return const OnBoardingPage();
        } else {
          return const HomePage();
        }
      } else {
        return Scaffold(
          body: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 5,
              child: Lottie.asset(
                'assets/lottie/loading.json',
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      }
    },
  );
}
