import 'package:dartx_validate/dartx_validate.dart';

class User {
  @Email()
  final String email;

  User(this.email);
}

void main() {
  final user = User('test@example.com');

  if (validate(user)) {
    print("OK");
  }
}
