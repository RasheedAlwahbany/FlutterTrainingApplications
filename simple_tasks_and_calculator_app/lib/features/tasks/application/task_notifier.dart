// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../domain/task_model.dart';

// class TaskNotifier extends StateNotifier<List<Task>> {
//   TaskNotifier() : super([]);

//   void addTask(String title) {
//     if (title.trim().isEmpty) return;

//     final task = Task(
//       id: DateTime.now().toString(),
//       title: title,
//     );

//     state = [...state, task];
//   }

//   void toggleTask(String id) {
//     state = state.map((task) {
//       if (task.id == id) {
//         return task.copyWith(completed: !task.completed);
//       }
//       return task;
//     }).toList();
//   }
// }

// final taskProvider =
//     StateNotifierProvider<TaskNotifier, List<Task>>(
//         (ref) => TaskNotifier());