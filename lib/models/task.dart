import 'package:hive/hive.dart';
part 'task.g.dart';

@HiveType(typeId: 0)
class Task {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final bool isDone;
  @HiveField(2)
  final String id;

  Task({
    required this.id,
    required this.title,
    this.isDone = false,
  });
}
