import 'package:flutter/material.dart';
import 'package:tood_em/constant/const.dart';
import 'package:tood_em/constant/product_colors.dart';

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
                floatingLabelStyle:
                    Theme.of(context).textTheme.headline6?.copyWith(
                          color: ProductColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                focusedBorder: Constant.slidableTextFieldBorder,
                enabledBorder: Constant.slidableTextFieldBorder,
                border: Constant.slidableTextFieldBorder,
                labelText: 'Task',
              ),
            ),
          ),
          Padding(
            padding: Constant.bottomSheetPadding,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ProductColors.primaryColor,
                foregroundColor: ProductColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: Constant.slidableRadius,
                ),
              ),
              onPressed: onPressed,
              child: Text(addOrEdit ? Constant.add : Constant.edit),
            ),
          ),
        ],
      ),
    );
  }
}
