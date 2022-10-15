import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tood_em/constant/const.dart';
import 'package:tood_em/constant/product_colors.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?)? checkboxCallback;
  final void Function(BuildContext)? deleteOnPressed;
  final void Function(BuildContext)? editOnPressed;
  const TaskTile(
      {super.key,
      required this.isChecked,
      required this.taskTitle,
      this.checkboxCallback,
      this.deleteOnPressed,
      this.editOnPressed});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
          //
          motion: const ScrollMotion(), //
          children: [
            SlidableAction(
              //padding: const EdgeInsets.symmetric(horizontal: 10),
              borderRadius: Constant.slidableRadius,
              onPressed: editOnPressed,
              label: Constant.edit,
              icon: Icons.edit,
            ),
            SlidableAction(
              backgroundColor: ProductColors.delete,
              borderRadius: Constant.slidableRadius,
              onPressed: deleteOnPressed,
              label: Constant.delete,
              icon: Icons.delete,
            ),
          ]),
      child: Card(
        color: ProductColors.primaryColor.withOpacity(0.7),
        child: ListTile(
          leading: Checkbox(
            fillColor: MaterialStateProperty.all(ProductColors.checkColor),
            value: isChecked,
            onChanged: checkboxCallback,
          ),
          title: Text(taskTitle,
              style: TextStyle(
                  fontFamily: 'Oswald',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  decoration: isChecked
                      ? TextDecoration.lineThrough
                      : TextDecoration.none)),
        ),
      ),
    );
  }
}
