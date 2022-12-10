import 'package:formz/formz.dart';

enum LastNameInputError { emptyError }

class LastNameInput extends FormzInput<String, LastNameInputError> {
  const LastNameInput.pure([super.value = '']) : super.pure();
  const LastNameInput.dirty([super.value = '']) : super.dirty();

  @override
  LastNameInputError? validator(String? value) {
    final val = value ?? '';
    return val.isEmpty ? LastNameInputError.emptyError : null;
  }
}
