import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/theme.dart';
import 'features/tasks/data/models/task_model.dart';
import 'features/tasks/application/providers/task_providers.dart';
import 'features/calculator/presentation/calculator_screen.dart';
import 'features/tasks/presentation/task_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  // ✅ FIX: must pass INSTANCE not type
  Hive.registerAdapter(TaskModelAdapter());

  final box = await Hive.openBox<TaskModel>('tasks');

  runApp(
    ProviderScope(
      overrides: [
        taskBoxProvider.overrideWithValue(box),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Tools',
      theme: appTheme,
      routes: {
        '/': (context) => CalculatorScreen(),
        '/tasks': (context) => TaskScreen(),
      },
    );
  }
}