import 'package:dartx_validate/dartx_validate.dart';

class User {
  @Email()
  final String email;

  @MinLength(2)
  @MaxLength(100)
  final String name;

  @Min(0)
  @Max(100)
  final int age;

  @Positive()
  final int id;

  User(this.name, this.email, this.age, this.id);
}

void main() {
  final user = User('John Doe', 'john.doe@example.com', 30, 1);

  if (validate(user)) {
    print("OK");
  }
}
