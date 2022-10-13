import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tood_em/constant/const.dart';
import 'package:tood_em/constant/product_colors.dart';
import 'package:tood_em/providers/provider.dart';
import 'package:tood_em/util/bottom_sheet.dart';
import 'package:tood_em/util/remain_task.dart';
import 'package:tood_em/util/toolbar.dart';

import '../util/task_list.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, ref) {
    final controller = ref.watch(editTextProvider);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        enableFeedback: false,
        backgroundColor: ProductColors.primaryColor.withOpacity(0.7),
        onPressed: () {
          showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => SingleChildScrollView(
                      child: Container(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: DialogWidget(
                      addOrEdit: true,
                      controller: controller,
                      onPressed: () {
                        ref.read(todoListProvider.notifier).addTask(
                              controller.text,
                            );
                        Navigator.of(context).pop();
                        controller.clear();
                      },
                    ),
                  )));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          Constant.appBarText,
          style: Theme.of(context).textTheme.headline2?.copyWith(
              color: ProductColors.white.withOpacity(0.7),
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          RemainTask(),
          Toolbar(),
          Expanded(
            flex: 2,
            child: TaskList(),
          ),
        ],
      ),
    );
  }
}
