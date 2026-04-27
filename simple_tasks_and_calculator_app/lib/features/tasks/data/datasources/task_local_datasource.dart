import 'package:hive/hive.dart';
import '../models/task_model.dart';

class TaskLocalDataSource {
  final Box<TaskModel> box;

  TaskLocalDataSource(this.box);

  List<TaskModel> getTasks() {
    return box.values.toList();
  }

  Future<void> addTask(TaskModel task) async {
    await box.put(task.id, task);
  }

  Future<void> toggleTask(String id) async {
    final task = box.get(id);
    if (task != null) {
      task.completed = !task.completed;
      await task.save();
    }
  }
}