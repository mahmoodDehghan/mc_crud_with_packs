import 'package:formz/formz.dart';

enum BankAccountInputError { emptyError, wrongError }

class BankAccountInput extends FormzInput<String, BankAccountInputError> {
  const BankAccountInput.pure([super.value = '']) : super.pure();
  const BankAccountInput.dirty([super.value = '']) : super.dirty();

  static final _bankAccountRegex = RegExp(
    r'^[0-9]{7,14}$',
  );

  BankAccountInputError? isEmpty(String value) {
    return value.isEmpty ? BankAccountInputError.emptyError : null;
  }

  BankAccountInputError? isMatch(String value) {
    return _bankAccountRegex.hasMatch(value)
        ? null
        : BankAccountInputError.wrongError;
  }

  @override
  BankAccountInputError? validator(String? value) {
    final val = value ?? '';
    BankAccountInputError? res = isEmpty(val);
    res ??= isMatch(val);
    return res;
  }
}
