import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/task_local_datasource.dart';
import '../models/task_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource local;

  TaskRepositoryImpl(this.local);

  @override
  Future<void> addTask(Task task) async {
    final model = TaskModel(
      id: task.id,
      title: task.title,
      completed: task.completed,
    );

    await local.addTask(model);
  }

  @override
  Future<List<Task>> getTasks() async {
    final models = local.getTasks();

    return models
        .map((m) => Task(
              id: m.id,
              title: m.title,
              completed: m.completed,
            ))
        .toList();
  }

  @override
  Future<void> toggleTask(String id) async {
    await local.toggleTask(id);
  }
}