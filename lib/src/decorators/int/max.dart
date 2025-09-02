import 'package:dartx_validate/dartx_validate.dart';

class Max implements Validator<int> {
  final int max;
  const Max(this.max);

  @override
  bool validate(int value) {
    return value <= max;
  }

  @override
  String get errorMessage => 'Value must be at most $max';
}
