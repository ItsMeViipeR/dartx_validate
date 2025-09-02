# Dartx Validate

Dartx Validate is a Zod-like validation library for Dart, providing a simple and expressive way to validate data structures.

## Features

- Decorators for easy validation
- Support for complex data structures
- Custom validation logic

## Getting Started

To get started with Dartx Validate, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  dartx_validate: ^1.0.0 # replace with the latest version
```

Then, import the package in your Dart code:

```dart
import 'package:dartx_validate/dartx_validate.dart';
```

## Usage

To create a schema with Dartx Validate, use the provided decorators. Here's an example of how to validate a simple user object:

```dart
import 'package:dartx_validate/dartx_validate.dart';

class User {
    @MinLength(3)
    @MaxLength(30)
    final String name;

    @Email()
    final String email;

    @Min(0)
    final int age;

    User({required this.name, required this.email, required this.age});
}
```

## Validation

To validate an instance of the `User` class, you can use the `validate` function provided by Dartx Validate:

```dart
import 'package:dartx_validate/dartx_validate.dart';

void main() {
    final user = User(name: 'John Doe', email: 'john.doe@example.com', age: 30);
    final errors = validate(user);
    if (errors.isNotEmpty) {
        print('Validation errors found:');
        for (var error in errors) {
            print('- $error');
        }
    } else {
        print('User is valid!');
    }
}
```

## Custom Validators

To create custom validators, you can extend the base validator class and implement your own logic:

```dart
import 'package:dartx_validate/dartx_validate.dart';

class IsEven extends Validator<int> {
    @override
    bool validate(int value) {
        return value % 2 == 0;
    }

    @override
    String get errorMessage => 'Value must be even';
}
```

### Use your custom Validator

```dart
class NumberHolder {
    @IsEven()
    final int number;

    NumberHolder({required this.number});
}
```

## Contributing

We welcome contributions to Dartx Validate! If you'd like to contribute, please follow these steps:

1. Fork the repository.
2. Create a new branch for your feature or bug fix.
3. Make your changes and add tests as appropriate.
4. Submit a pull request detailing your changes.

Thank you for your interest in improving Dartx Validate!
