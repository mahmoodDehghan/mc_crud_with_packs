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
      const input = BankAccountInput.dirty('IR110570033780012625008101');
      expect(input.status, FormzInputStatus.valid);
    });
  });
}
