// ignore_for_file: prefer_final_fields

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:tood_em/constant/const.dart';

import 'package:tood_em/models/task.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class TaskData extends StateNotifier<List<Task>> {
  // In this class, we are using Hive to store the data.
  // and in super(), we are passing the data from the box to the state.

  TaskData() : super(_readFromHive());

  // This function is used to get the data from the box.
  // And if the box is empty, we are initializing default data.
  static List<Task> _readFromHive() {
    final box = Hive.box(Constant.boxName);
    final list = box.get(Constant.boxGetter, defaultValue: <Task>[
      Task(
        id: _uuid.v4(),
        title: Constant.initialBoxMessage,
        isDone: false,
      ),
    ]);
    // We are returning the list of tasks. But we are converting it to a list of Task. with the help of .cast<Task>()
    // It is because, the data we are getting from the box is a list of dynamic. 
    // SOOOO IMPORTANT O.O I ve been stuck on this for a night 🥲.
    return list.cast<Task>();
  }

  // And in every action, we are updating the box.
  void _saveToHive() {
    final box = Hive.box(Constant.boxName);
    box.put(Constant.boxGetter, state);
  }

  void addTask(String taskName) {
    // Controlled if the task is empty or not
    if (taskName.isNotEmpty) {
      final newTask = Task(
        id: _uuid.v4(),
        title: taskName,
        isDone: false,
      );
      state = [...state, newTask];
      _saveToHive();
    } else {
      state = [
        ...state,
        Task(id: _uuid.v4(), title: 'Bunu düzenle 🤗', isDone: false),
      ];
      _saveToHive();
    }
  }

  void toggle(String id) {
    state = [
      for (final task in state)
        if (task.id == id)
          Task(
            id: task.id,
            isDone: !task.isDone,
            title: task.title,
          )
        else
          task,
    ];
    _saveToHive();
  }

  void edit({required String id, required String title}) {
    state = [
      for (final task in state)
        if (task.id == id)
          Task(
            id: task.id,
            isDone: task.isDone,
            title: title,
          )
        else
          task,
    ];
    _saveToHive();
  }

  // So when we want to remove a task,
  // we can use where() method to filter out the task we want to remove.

  void remove(Task target) {
    state = state.where((todo) => todo.id != target.id).toList();
    _saveToHive();
  }
}

enum TaskFilter { all, active, completed }
