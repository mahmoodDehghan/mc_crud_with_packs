import 'package:formz/formz.dart';
import 'package:iban/iban.dart';

enum BankAccountInputError { emptyError, wrongError }

class BankAccountInput extends FormzInput<String, BankAccountInputError> {
  const BankAccountInput.pure([super.value = '']) : super.pure();
  const BankAccountInput.dirty([super.value = '']) : super.dirty();

  BankAccountInputError? isEmpty(String value) {
    return value.isEmpty ? BankAccountInputError.emptyError : null;
  }

  BankAccountInputError? isMatch(String value) {
    //is Valid checks entry is in IBan Bank format
    return isValid(value) ? null : BankAccountInputError.wrongError;
  }

  @override
  BankAccountInputError? validator(String? value) {
    final val = value ?? '';
    BankAccountInputError? res = isEmpty(val);
    res ??= isMatch(val);
    return res;
  }
}
