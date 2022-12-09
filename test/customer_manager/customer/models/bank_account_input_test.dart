import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mc_crud/mc_crud.dart';

void main() {
  group('bank account input tests', () {
    test('bank account input empty test', () {
      const input = BankAccountInput.dirty('');
      expect(input.status, FormzInputStatus.invalid);
    });
    test('bank account input right string test', () {
      const input = BankAccountInput.dirty('123345457634');
      expect(input.status, FormzInputStatus.valid);
    });
  });
}
