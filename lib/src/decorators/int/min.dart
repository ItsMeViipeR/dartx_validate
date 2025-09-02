import 'package:dartx_validate/dartx_validate.dart';

class Min implements Validator<int> {
  final int min;
  const Min(this.min);

  @override
  bool validate(int value) {
    print('Validating $value >= $min');
    return value >= min;
  }

  @override
  String get errorMessage => 'Value must be at least $min';
}
