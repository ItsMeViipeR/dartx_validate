import 'package:dartx_validate/dartx_validate.dart';

class MinLength implements Validator<String> {
  final int min;
  const MinLength(this.min);

  @override
  bool validate(String value) {
    return value.length >= min;
  }

  @override
  String get errorMessage => 'Value must be at least $min characters long';
}
