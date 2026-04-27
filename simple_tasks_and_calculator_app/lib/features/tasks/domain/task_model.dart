class Task {
  final String id;
  final String title;
  final bool completed;

  Task({
    required this.id,
    required this.title,
    this.completed = false,
  });

  Task copyWith({bool? completed}) {
    return Task(
      id: id,
      title: title,
      completed: completed ?? this.completed,
    );
  }
}