import 'package:dartx_validate/dartx_validate.dart';

class Positive implements Validator<int> {
  const Positive();

  @override
  bool validate(int value) {
    return value > 0;
  }

  @override
  String get errorMessage => 'Value must be positive';
}