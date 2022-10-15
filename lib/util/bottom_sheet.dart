import 'package:flutter/material.dart';
import 'package:tood_em/constant/const.dart';
import 'package:tood_em/constant/product_colors.dart';
import 'package:tood_em/constant/text_style.dart';

class DialogWidget extends StatelessWidget {
  const DialogWidget(
      {Key? key,
      required this.controller,
      this.onPressed,
      required this.addOrEdit})
      : super(key: key);

  final TextEditingController controller;
  final void Function()? onPressed;
  final bool addOrEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: Constant.bottomDecoration,
      child: Column(
        children: [
          Padding(
            padding: Constant.slidableTitlePadding,
            child: Text(
              addOrEdit ? Constant.addTask : Constant.editTask,
              style: Theme.of(context).textTheme.headline5?.copyWith(
                    color: ProductColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Padding(
            padding: Constant.bottomSheetPadding,
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                floatingLabelStyle: ProductTextSyle.bottomSheetTextStyle,
                focusedBorder: Constant.slidableTextFieldBorder,
                enabledBorder: Constant.slidableTextFieldBorder,
                border: Constant.slidableTextFieldBorder,
                labelText: Constant.labelText,
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                labelStyle: ProductTextSyle.bottomSheetTextStyle.copyWith(
                  color: ProductColors.primaryColor.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Padding(
            padding: Constant.bottomSheetPadding,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                enableFeedback: false,
                backgroundColor: ProductColors.primaryColor,
                foregroundColor: ProductColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: Constant.slidableRadius,
                ),
              ),
              onPressed: onPressed,
              child: Text(addOrEdit ? Constant.add : Constant.edit,
                  style: ProductTextSyle.bottomSheetButtonStyle),
            ),
          ),
        ],
      ),
    );
  }
}
