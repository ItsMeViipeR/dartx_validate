import 'package:dartx_validate/dartx_validate.dart';

class NotEmpty implements Validator<String> {
  const NotEmpty();

  @override
  bool validate(String value) {
    return value.isNotEmpty;
  }

  @override
  String get errorMessage => 'Value must not be empty';
}
