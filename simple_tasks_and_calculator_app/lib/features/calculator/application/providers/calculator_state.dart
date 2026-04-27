import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'calculator_providers.dart';

class CalculatorNotifier extends StateNotifier<String> {
  final Ref ref;

  CalculatorNotifier(this.ref) : super("0");

  void input(String value) {
    if (state == "0") {
      state = value;
    } else {
      state += value;
    }
  }

  void clear() {
    state = "0";
  }

  void calculate() {
    final result = ref
        .read(evaluateExpressionProvider)
        .call(state);

    state = result;
  }
}

final calculatorNotifierProvider =
    StateNotifierProvider<CalculatorNotifier, String>(
        (ref) => CalculatorNotifier(ref));