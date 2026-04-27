import '../entities/task.dart';
import '../repositories/task_repository.dart';

class GetTasks {
  final TaskRepository repo;

  GetTasks(this.repo);

  Future<List<Task>> call() {
    return repo.getTasks();
  }
}