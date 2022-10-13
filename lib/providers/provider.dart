import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tood_em/database/data.dart';
import 'package:tood_em/models/task.dart';

final todoListProvider = StateNotifierProvider<TaskData, List<Task>>((ref) {
  return TaskData();
});
