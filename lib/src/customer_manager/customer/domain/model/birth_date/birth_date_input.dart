import 'package:formz/formz.dart';
import 'package:mc_crud/mc_crud.dart';

enum BirthDateError { emptyError, wrongError }

class BirthDateInput extends FormzInput<String, BirthDateError> {
  const BirthDateInput.pure([super.value = '']) : super.pure();
  const BirthDateInput.dirty([super.value = '']) : super.dirty();

  BirthDateError? isEmpty(String value) {
    return value.isEmpty ? BirthDateError.emptyError : null;
  }

  bool isValid(String entry) {
    final date = BirthDate.fromString(entry);
    return date.birthDate
        .isBefore(DateTime.now().subtract(const Duration(days: 365 * 18)));
  }

  BirthDateError? isMatch(String value) {
    //is Valid checks age is bigger than 18
    return isValid(value) ? null : BirthDateError.wrongError;
  }

  @override
  BirthDateError? validator(String? value) {
    final val = value ?? '';
    BirthDateError? res = isEmpty(val);
    res ??= isMatch(val);
    return res;
  }
}
