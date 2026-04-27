import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/task.dart';
import 'task_providers.dart';

class TaskNotifier extends StateNotifier<List<Task>> {
  final Ref ref;

  TaskNotifier(this.ref) : super([]);

  Future<void> load() async {
    state = await ref.read(getTasksProvider).call();
  }

  Future<void> add(String title) async {
    await ref.read(addTaskProvider).call(title);
    await load();
  }

  Future<void> toggle(String id) async {
    await ref.read(toggleTaskProvider).call(id);
    await load();
  }
}

final taskNotifierProvider =
    StateNotifierProvider<TaskNotifier, List<Task>>(
        (ref) => TaskNotifier(ref));