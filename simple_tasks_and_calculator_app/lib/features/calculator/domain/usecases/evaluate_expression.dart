import '../repositories/calculator_repository.dart';

class EvaluateExpression {
  final CalculatorRepository repo;

  EvaluateExpression(this.repo);

  String call(String expression) {
    return repo.evaluate(expression);
  }
}