import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tood_em/pages/home_page.dart';
import 'package:tood_em/theme/theme.dart';

void main() async {
  runApp(
    const ProviderScope(
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ProductTheme.lightTheme,
      title: 'TOOD\'EM',
      home: HomePage(),
    );
  }
}
