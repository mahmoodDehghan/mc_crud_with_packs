import 'package:formz/formz.dart';

enum FirstNameInputError { emptyError }

class FirstNameInput extends FormzInput<String, FirstNameInputError> {
  const FirstNameInput.pure([super.value = '']) : super.pure();
  const FirstNameInput.dirty([super.value = '']) : super.dirty();

  @override
  FirstNameInputError? validator(String? value) {
    final val = value ?? '';
    return val.isEmpty ? FirstNameInputError.emptyError : null;
  }
}
