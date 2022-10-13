import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tood_em/constant/const.dart';
import 'package:tood_em/constant/product_colors.dart';
import 'package:tood_em/models/task.dart';
import 'package:tood_em/providers/provider.dart';
import 'package:tood_em/util/bottom_sheet.dart';
import 'package:tood_em/util/remain_task.dart';

import '../util/task_list.dart';

class HomePage extends ConsumerWidget {
  final TextEditingController _controller = TextEditingController();

  HomePage({super.key});
  @override
  Widget build(BuildContext context, ref) {
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
                      controller: _controller,
                      onPressed: () {
                        ref.read(todoListProvider.notifier).addTask(
                              _controller.text,
                            );
                        Navigator.of(context).pop();
                        _controller.clear();
                      },
                    ),
                  )));
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(Constant.appBarText),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const RemainTask(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.2,
          ),
          const Expanded(
            flex: 2,
            child: TaskList(),
          ),
        ],
      ),
    );
  }
}
