import 'package:dartx_validate/dartx_validate.dart';

class Email implements Validator<String> {
  const Email();

  @override
  bool validate(String value) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(value);
  }

  @override
  String get errorMessage => 'Invalid email address';

  @override
  String toString() {
    return 'Email Validator: $errorMessage';
  }
}
