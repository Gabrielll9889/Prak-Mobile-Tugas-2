class Task {
  final String id;
  final String title;
  final String description;
  final DateTime deadline;
  bool isCompleted;

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.deadline,
    this.isCompleted = false,
  });
}
