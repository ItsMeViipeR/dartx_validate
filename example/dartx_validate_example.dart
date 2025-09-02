import 'package:dartx_validate/dartx_validate.dart';

class User {
  @Email()
  final String email;

  @Min(0)
  @Max(100)
  final int age;

  User(this.email, this.age);
}

void main() {
  final user = User('test@example.com', 25);

  if (validate(user)) {
    print("OK");
  }
}
