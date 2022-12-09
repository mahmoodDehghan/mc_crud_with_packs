import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mc_crud/mc_crud.dart';

void main() {
  group('emailInputTests', () {
    late EmailInput tempInput;
    test('test empty input', () {
      tempInput = const EmailInput.pure();
      final status = Formz.validate([tempInput]);
      expect(status, FormzStatus.pure);
      expect(tempInput.validator(tempInput.value) == EmailInputError.emptyError,
          isTrue);
    });
    test('test wrong format', () {
      tempInput = const EmailInput.dirty('asdfds');
      final status = Formz.validate([tempInput]);
      expect(status, FormzStatus.invalid);
      expect(
          tempInput.validator(tempInput.value) == EmailInputError.formatError,
          isTrue);
    });
    test('test right input', () {
      tempInput = const EmailInput.dirty('test@test.com');
      final status = Formz.validate([tempInput]);
      expect(status, FormzStatus.valid);
      expect(tempInput.validator(tempInput.value), isNull);
    });
  });
}
