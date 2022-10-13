import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tood_em/constant/const.dart';
import 'package:tood_em/constant/product_colors.dart';
import 'package:tood_em/providers/provider.dart';

class RemainTask extends StatelessWidget {
  const RemainTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ProductColors.white.withOpacity(0.5),
      ),
      // Remaining Tasks && Today's Date
      child: Consumer(
        builder: (context, ref, child) {
          // Fixed the bug of not updating the remaining tasks
          final taskList = ref.watch(todoListProvider);
          final remainingTask = taskList.where((task) => !task.isDone).length;
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: Constant.upTextPadding,
                child: Text(
                  'Remaining Tasks: $remainingTask',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: ProductColors.checkColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Padding(
                padding: Constant.upTextPadding,
                child: Text(
                  'Today\'s Date: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: ProductColors.checkColor),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
