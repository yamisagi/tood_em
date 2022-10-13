class Task {
  final String title;
  final bool isDone;
  final String id;

  Task({
    required this.id,
    required this.title,
    this.isDone = false,
  });
}
