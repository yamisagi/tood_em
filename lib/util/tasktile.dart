import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tood_em/constant/product_colors.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?)? checkboxCallback;
  const TaskTile({
    Key? key,
    required this.isChecked,
    required this.taskTitle,
    this.checkboxCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
          //

          motion: const ScrollMotion(), //
          children: [
            SlidableAction(
              //padding: const EdgeInsets.symmetric(horizontal: 10),
              borderRadius: BorderRadius.circular(10),
              onPressed: (context) {},
              label: 'Edit',
              icon: Icons.edit,
            ),
            SlidableAction(
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(10),
              onPressed: (context) {},
              label: 'Delete',
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
          title: Text(
            taskTitle,
            style: TextStyle(
                decoration: isChecked ? TextDecoration.lineThrough : null),
          ),
        ),
      ),
    );
  }
}
