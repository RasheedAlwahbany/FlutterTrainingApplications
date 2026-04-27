import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../application/providers/calculator_state.dart';

class CalculatorScreen extends ConsumerWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final display = ref.watch(calculatorNotifierProvider);

    return Scaffold(
      appBar: AppBar(
          title: const Text("Calculator"),
          actions: [
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                Navigator.pushNamed(context, '/tasks');
              },
            )
          ],
        ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              child: Text(
                display,
                style: const TextStyle(fontSize: 32),
              ),
            ),
          ),
          GridView.count(
            crossAxisCount: 4,
            shrinkWrap: true,
            children: [
              "7","8","9","/",
              "4","5","6","*",
              "1","2","3","-",
              "0","C","=","+",
            ].map((btn) {
              return ElevatedButton(
                onPressed: () {
                  final notifier =
                      ref.read(calculatorNotifierProvider.notifier);

                  if (btn == "C") {
                    notifier.clear();
                  } else if (btn == "=") {
                    notifier.calculate();
                  } else {
                    notifier.input(btn);
                  }
                },
                child: Text(btn),
              );
            }).toList(),
          )
        ],
      ),
    );
  }
}