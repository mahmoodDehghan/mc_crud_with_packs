import 'package:formz/formz.dart';

enum EmailInputError { emptyError, formatError }

class EmailInput extends FormzInput<String, EmailInputError> {
  const EmailInput.pure([super.value = '']) : super.pure();
  const EmailInput.dirty([super.value = '']) : super.dirty();

  static final _emailRegex = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  EmailInputError? isEmpty(String value) {
    return value.isEmpty ? EmailInputError.emptyError : null;
  }

  EmailInputError? isMatch(String value) {
    return _emailRegex.hasMatch(value) ? null : EmailInputError.formatError;
  }

  @override
  EmailInputError? validator(String? value) {
    final val = value ?? '';
    EmailInputError? res = isEmpty(val);
    res ??= isMatch(val);
    return res;
  }
}
