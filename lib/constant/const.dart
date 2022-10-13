import 'package:flutter/material.dart';
import 'package:tood_em/constant/product_colors.dart';

class Constant {
  static const appBarText = 'TOOD\'EM';
  static const addTask = 'Add Task';
  static const editTask = 'Edit Task';
  static const edit = 'Edit';
  static const delete = 'Delete';
  static const add = 'Add';

  // -----------RADIUS & PADDING-----------
  static final slidableRadius = BorderRadius.circular(10);
  static const upTextPadding = EdgeInsets.symmetric(horizontal: 5, vertical: 5);
  static const bottomSheetPadding = EdgeInsets.all(12.0);
  static const slidableTitlePadding = EdgeInsets.symmetric(vertical: 30);
  static const tilePadding = EdgeInsets.symmetric(horizontal: 12, vertical: 6);
  static const listViewMargin = EdgeInsets.symmetric(horizontal: 12);
  static const toolBarMargin =
      EdgeInsets.symmetric(horizontal: 12, vertical: 12);
  static final toolBarRadius = BorderRadius.circular(10);

  // -----------DECORATIONS & STYLE-----------
  static const bottomDecoration = BoxDecoration(
    color: ProductColors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    ),
  );
  static final slidableTextFieldBorder = OutlineInputBorder(
    borderSide: BorderSide(
      width: 2,
      color: ProductColors.primaryColor,
    ),
  );
}
