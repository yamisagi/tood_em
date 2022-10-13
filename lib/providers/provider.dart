import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tood_em/database/data.dart';
import 'package:tood_em/models/task.dart';

final todoListProvider = StateNotifierProvider<TaskData, List<Task>>((ref) {
  return TaskData();
});

final editTextProvider = StateProvider<TextEditingController>((ref) {
  return TextEditingController();
});
final todoListFilter = StateProvider((_) => TaskFilter.all);
final uncompletedTodosCount = Provider<int>((ref) {
  return ref.watch(todoListProvider).where((task) => !task.isDone).length;
});
final filteredTodos = Provider<List<Task>>((ref) {
  final filter = ref.watch(todoListFilter);
  final tasks = ref.watch(todoListProvider);

  switch (filter) {
    case TaskFilter.completed:
      return tasks.where((task) => task.isDone).toList();
    case TaskFilter.active:
      return tasks.where((task) => !task.isDone).toList();
    case TaskFilter.all:
      return tasks;
  }
});
