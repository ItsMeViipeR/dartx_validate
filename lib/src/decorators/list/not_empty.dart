import 'package:dartx_validate/dartx_validate.dart';

class NotEmptyList implements Validator<List> {
  const NotEmptyList();

  @override
  bool validate(List value) {
    return value.isNotEmpty;
  }

  @override
  String get errorMessage => 'List must not be empty';
}
