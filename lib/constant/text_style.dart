import 'package:flutter/material.dart';
import 'package:tood_em/constant/product_colors.dart';

class ProductTextSyle {
  static final appBarStyle = TextStyle(
      color: ProductColors.white.withOpacity(0.7),
      fontFamily: 'Pacifico',
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic);
  static final onboardStyle = TextStyle(
      fontFamily: 'Pacifico',
      color: ProductColors.white.withOpacity(0.7),
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.italic,
      fontSize: 35);
  static final onBoardSubtitle = TextStyle(
    fontFamily: 'Oswald',
    color: ProductColors.white.withOpacity(0.7),
    fontWeight: FontWeight.w500,
    
    fontSize: 22,
  );

  static const remainTextStyle = TextStyle(
    fontFamily: 'Oswald',
    color: ProductColors.checkColor,
    fontSize: 15,
    fontWeight: FontWeight.bold,
  );
  static final bottomSheetTextStyle = TextStyle(
    fontFamily: 'Oswald',
    color: ProductColors.primaryColor,
    fontWeight: FontWeight.bold,
  );
  static const bottomSheetButtonStyle = TextStyle(
    fontFamily: 'Oswald',
    color: ProductColors.white,
    fontWeight: FontWeight.bold,
  );
}
