import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/providers/task_state.dart';

class TaskScreen extends ConsumerStatefulWidget {
  const TaskScreen({super.key});

  @override
  ConsumerState<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends ConsumerState<TaskScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // ✅ Load tasks when screen opens
    Future.microtask(() {
      ref.read(taskNotifierProvider.notifier).load();
    });
  }

  @override
  Widget build(BuildContext context) {
    final tasks = ref.watch(taskNotifierProvider);

    return Scaffold(
      appBar: AppBar(title: const Text("Tasks")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "Enter task",
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () async {
                    await ref
                        .read(taskNotifierProvider.notifier)
                        .add(controller.text);

                    controller.clear();
                  },
                )
              ],
            ),
          ),
          Expanded(
            child: tasks.isEmpty
                ? const Center(child: Text("No tasks yet"))
                : ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];

                      return ListTile(
                        title: Text(task.title),
                        trailing: Checkbox(
                          value: task.completed,
                          onChanged: (_) async {
                            await ref
                                .read(taskNotifierProvider.notifier)
                                .toggle(task.id);
                          },
                        ),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}