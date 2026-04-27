import 'package:math_expressions/math_expressions.dart';
import '../../domain/repositories/calculator_repository.dart';

class CalculatorRepositoryImpl implements CalculatorRepository {
  @override
  String evaluate(String expression) {
    try {
      Parser p = Parser();
      Expression exp = p.parse(expression);

      ContextModel cm = ContextModel();
      double result = exp.evaluate(EvaluationType.REAL, cm);

      return result.toString();
    } catch (e) {
      return "Error";
    }
  }
}