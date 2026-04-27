import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../data/datasources/task_local_datasource.dart';
import '../../data/models/task_model.dart';
import '../../data/repositories/task_repository_impl.dart';
import '../../domain/usecases/add_task.dart';
import '../../domain/usecases/get_tasks.dart';
import '../../domain/usecases/toggle_task.dart';

// Hive Box
final taskBoxProvider = Provider<Box<TaskModel>>((ref) {
  throw UnimplementedError(); // injected in main
});

// DataSource
final taskLocalDataSourceProvider = Provider((ref) {
  return TaskLocalDataSource(ref.watch(taskBoxProvider));
});

// Repository
final taskRepositoryProvider = Provider((ref) {
  return TaskRepositoryImpl(ref.watch(taskLocalDataSourceProvider));
});

// UseCases
final addTaskProvider = Provider((ref) {
  return AddTask(ref.watch(taskRepositoryProvider));
});

final getTasksProvider = Provider((ref) {
  return GetTasks(ref.watch(taskRepositoryProvider));
});

final toggleTaskProvider = Provider((ref) {
  return ToggleTask(ref.watch(taskRepositoryProvider));
});