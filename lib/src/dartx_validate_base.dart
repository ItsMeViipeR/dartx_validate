import 'dart:mirrors';

import 'package:dartx_validate/dartx_validate.dart';

bool validate(Object obj) {
  final instanceMirror = reflect(obj);
  final classMirror = instanceMirror.type;

  for (var decl in classMirror.declarations.values) {
    if (decl is VariableMirror) {
      final fieldValue = instanceMirror.getField(decl.simpleName).reflectee;

      // Parcourir les annotations
      for (var meta in decl.metadata) {
        final annotationType = meta.reflectee.runtimeType;

        if (annotationType == Email && fieldValue is String) {
          final validator = Email();
          if (!validator.validate(fieldValue)) {
            return false;
          }
        }

        if (annotationType == Min && fieldValue is int) {
          final minValue = (meta.reflectee as Min).min;
          final validator = Min(minValue);
          if (!validator.validate(fieldValue)) {
            return false;
          }
        }

        if (annotationType == Max && fieldValue is int) {
          final maxValue = (meta.reflectee as Max).max;
          final validator = Max(maxValue);
          if (!validator.validate(fieldValue)) {
            return false;
          }
        }

        if (annotationType == MinLength && fieldValue is String) {
          final minLength = (meta.reflectee as MinLength).min;
          final validator = MinLength(minLength);
          if (!validator.validate(fieldValue)) {
            return false;
          }
        }

        if (annotationType == MaxLength && fieldValue is String) {
          final maxLength = (meta.reflectee as MaxLength).max;
          final validator = MaxLength(maxLength);
          if (!validator.validate(fieldValue)) {
            return false;
          }
        }

        if (annotationType == Positive && fieldValue is int) {
          final validator = Positive();

          if (!validator.validate(fieldValue)) {
            return false;
          }
        }

        if (annotationType == NotEmptyString && fieldValue is String) {
          final validator = NotEmptyString();

          if (!validator.validate(fieldValue)) {
            return false;
          }
        }

        if (annotationType == NotEmptyList && fieldValue is List) {
          final validator = NotEmptyList();

          if (!validator.validate(fieldValue)) {
            return false;
          }
        }
      }
    }
  }

  return true;
}
