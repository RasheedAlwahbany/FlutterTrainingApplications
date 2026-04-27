import '../entities/task.dart';
import '../repositories/task_repository.dart';

class AddTask {
  final TaskRepository repo;

  AddTask(this.repo);

  Future<void> call(String title) async {
    final task = Task(
      id: DateTime.now().toString(),
      title: title,
      completed: false,
    );

    await repo.addTask(task);
  }
}