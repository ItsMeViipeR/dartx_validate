import 'package:dartx_validate/dartx_validate.dart';
import 'package:test/test.dart';

import '../example/dartx_validate_example.dart';

void main() {
  final correctUser = User("test@example.com");
  final incorrectUser = User("test#example.com");

  group("Validators", () {
    test("Email Validator", () {
      expect(validate(correctUser), true);
    });

    test("Email Validator - Invalid", () {
      expect(validate(incorrectUser), false);
    });
  });
}
