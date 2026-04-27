import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/repositories/calculator_repository_impl.dart';
import '../../domain/usecases/evaluate_expression.dart';

// Repository
final calculatorRepositoryProvider = Provider((ref) {
  return CalculatorRepositoryImpl();
});

// UseCase
final evaluateExpressionProvider = Provider((ref) {
  return EvaluateExpression(ref.watch(calculatorRepositoryProvider));
});