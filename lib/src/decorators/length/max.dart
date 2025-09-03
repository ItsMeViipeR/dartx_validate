import 'package:dartx_validate/dartx_validate.dart';

class MaxLength implements Validator<String> {
  final int max;
  const MaxLength(this.max);

  @override
  bool validate(String value) {
    return value.length <= max;
  }

  @override
  String get errorMessage => 'Value must be at most $max characters long';
}
