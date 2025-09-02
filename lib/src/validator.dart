abstract class Validator<T> {
  const Validator();

  bool validate(T value) {
    return true;
  }

  String get errorMessage => 'Invalid value';

  @override
  String toString() {
    return 'Validator: $errorMessage';
  }
}
