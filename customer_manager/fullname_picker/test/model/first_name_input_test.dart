import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:fullname_picker/fullname_picker.dart';

void main() {
  group('firstNameInputs tests', () {
    test('empty string test', () {
      const fInput = FirstNameInput.dirty("");
      final status = Formz.validate([fInput]);
      expect(status, FormzStatus.invalid);
      expect(fInput.validator(fInput.value), FirstNameInputError.emptyError);
    });
    test('right string test', () {
      const fInput = FirstNameInput.dirty("mahmoud");
      final status = Formz.validate([fInput]);
      expect(status, FormzStatus.valid);
    });
  });
}
