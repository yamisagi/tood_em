import 'package:flutter/material.dart';
import 'package:tood_em/constant/product_colors.dart';

class ProductTheme {
  static ThemeData lightTheme = ThemeData.light(useMaterial3: true).copyWith(
      scaffoldBackgroundColor: ProductColors.primaryColor,
      appBarTheme: AppBarTheme(
        backgroundColor: ProductColors.primaryColor,
        foregroundColor: Colors.black,
        centerTitle: true,
        scrolledUnderElevation: 0,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ));
}
