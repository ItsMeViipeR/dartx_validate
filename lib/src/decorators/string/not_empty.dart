import 'package:dartx_validate/dartx_validate.dart';

class NotEmptyString implements Validator<String> {
  const NotEmptyString();

  @override
  bool validate(String value) {
    return value.isNotEmpty;
  }

  @override
  String get errorMessage => 'Value must not be empty';
}
