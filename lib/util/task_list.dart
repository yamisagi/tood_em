import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tood_em/providers/provider.dart';
import 'package:tood_em/util/tasktile.dart';

class TaskList extends ConsumerWidget {
  const TaskList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final taskList = ref.watch(todoListProvider);
    
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      height: MediaQuery.of(context).size.height * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white.withOpacity(0.5),
      ),
      child: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: TaskTile(
            checkboxCallback: (value) =>
                ref.read(todoListProvider.notifier).toggle(taskList[index].id),
            isChecked: taskList[index].isDone,
            taskTitle: taskList[index].title,
          ),
        ),
      ),
    );
  }
}
