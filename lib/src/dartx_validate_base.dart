import 'dart:mirrors';

import 'package:dartx_validate/dartx_validate.dart';

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

bool validate(Object obj) {
  final instanceMirror = reflect(obj);
  final classMirror = instanceMirror.type;

  for (var decl in classMirror.declarations.values) {
    if (decl is VariableMirror) {
      final fieldValue = instanceMirror.getField(decl.simpleName).reflectee;

      // Parcourir les annotations
      for (var meta in decl.metadata) {
        final annotationType = meta.reflectee.runtimeType;

        if (annotationType == Email) {
          final validator = Email();
          if (!validator.validate(fieldValue)) {
            print(validator.errorMessage);
            return false;
          }
        }

        // Ici tu peux ajouter d'autres décorateurs et validators
      }
    }
  }

  return true;
}
