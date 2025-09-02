import 'package:dartx_validate/dartx_validate.dart';
import 'package:test/test.dart';

import '../example/dartx_validate_example.dart';

void main() {
  final correctUser = User("test@example.com", 25);
  final incorrectEmail = User("test#example.com", 25);
  final incorrectAge = User("test@example.com", -1);

  group("Validators", () {
    test("Email Validator", () {
      expect(validate(correctUser), true);
    });

    test("Email Validator - Invalid", () {
      expect(validate(incorrectEmail), false);
    });

    test("Age Validator - Invalid", () {
      expect(validate(incorrectAge), false);
    });
  });
}
