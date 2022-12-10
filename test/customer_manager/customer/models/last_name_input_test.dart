import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mc_crud/mc_crud.dart';

void main() {
  group('lirstNameInputs tests', () {
    test('empty string test', () {
      const lInput = LastNameInput.dirty("");
      final status = Formz.validate([lInput]);
      expect(status, FormzStatus.invalid);
      expect(lInput.validator(lInput.value), LastNameInputError.emptyError);
    });
    test('right string test', () {
      const fInput = LastNameInput.dirty("dehghan");
      final status = Formz.validate([fInput]);
      expect(status, FormzStatus.valid);
    });
  });
}
