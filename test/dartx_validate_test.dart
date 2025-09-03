import 'package:dartx_validate/dartx_validate.dart';
import 'package:test/test.dart';

import '../example/dartx_validate_example.dart';

void main() {
  final correctUser = User('John Doe', 'john.doe@example.com', 30, 1);
  final incorrectEmail = User("John Doe", "test#example.com", 25, 1);
  final incorrectAge = User("John Doe", "test@example.com", -1, 1);
  final incorrectMaxAge = User("John Doe", "test@example.com", 151, 1);
  final incorrectName = User("J", "john.doe@example.com", 30, 1);
  final incorrectId = User("John Doe", "john.doe@example.com", 30, -1);
  final emptyName = User("", "john.doe@example.com", 30, 1);

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

    test("Age Validator - Invalid", () {
      expect(validate(incorrectMaxAge), false);
    });

    test("Name Validator - Invalid", () {
      expect(validate(incorrectName), false);
    });

    test("ID Validator - Invalid", () {
      expect(validate(incorrectId), false);
    });

    test("Name Validator - Empty", () {
      expect(validate(emptyName), false);
    });
  });
}
