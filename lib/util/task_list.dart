import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tood_em/constant/const.dart';
import 'package:tood_em/providers/provider.dart';
import 'package:tood_em/util/bottom_sheet.dart';
import 'package:tood_em/util/tasktile.dart';

class TaskList extends ConsumerWidget {
  const TaskList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final taskListNotifier = ref.read(todoListProvider.notifier);
    final controller = ref.watch(editTextProvider);
    final lastList = ref.watch(filteredTodos);

    return Container(
      margin: Constant.listViewMargin,
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.5),
      ),
      child: ListView.builder(
        itemCount: lastList.length,
        itemBuilder: (context, index) => Padding(
          padding: Constant.tilePadding,
          child: TaskTile(
            editOnPressed: (context) {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: DialogWidget(
                      addOrEdit: false,
                      controller: controller,
                      onPressed: () {
                        taskListNotifier.edit(
                          id: lastList[index].id,
                          title: controller.text,
                        );
                        Navigator.of(context).pop();
                        controller.clear();
                      },
                    ),
                  ),
                ),
              );
            },
            deleteOnPressed: (context) =>
                taskListNotifier.remove(lastList[index]),
            checkboxCallback: (value) =>
                taskListNotifier.toggle(lastList[index].id),
            isChecked: lastList[index].isDone,
            taskTitle: lastList[index].title,
          ),
        ),
      ),
    );
  }
}
