// ignore_for_file: prefer_final_fields

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:tood_em/models/task.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class TaskData extends StateNotifier<List<Task>> {
  TaskData([List<Task>? initialTodos]) : super(initialTodos ?? []);
  void addTask(String taskName) {
    // Controlled if the task is empty or not
    if (taskName.isNotEmpty) {
      state = [
        ...state,
        Task(id: _uuid.v4(), title: taskName, isDone: false),
      ];
    } else {
      state = [
        ...state,
        Task(id: _uuid.v4(), title: 'Edit this one 🤗', isDone: false),
      ];
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
  }

  // So when we want to remove a task,
  // we can use where() method to filter out the task we want to remove.

  void remove(Task target) {
    state = state.where((todo) => todo.id != target.id).toList();
  }
}

enum TaskFilter { all, active, completed }
