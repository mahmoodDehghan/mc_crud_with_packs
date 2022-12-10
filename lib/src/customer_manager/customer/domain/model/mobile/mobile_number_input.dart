import 'package:formz/formz.dart';
import 'package:phone_form_field/phone_form_field.dart';

enum MobileNumberError { emptyError, wrongError }

class MobileNumberInput extends FormzInput<String, MobileNumberError> {
  const MobileNumberInput.pure([super.value = '']) : super.pure();
  const MobileNumberInput.dirty([super.value = '']) : super.dirty();

  MobileNumberError? isEmpty(String value) {
    return value.isEmpty ? MobileNumberError.emptyError : null;
  }

  bool isValid(String entry) {
    final number = PhoneNumber.parse(entry);
    return number.isValid(type: PhoneNumberType.mobile);
  }

  MobileNumberError? isMatch(String value) {
    //is Valid checks mobile number is right
    return isValid(value) ? null : MobileNumberError.wrongError;
  }

  @override
  MobileNumberError? validator(String? value) {
    final val = value ?? '';
    MobileNumberError? res = isEmpty(val);
    res ??= isMatch(val);
    return res;
  }
}
