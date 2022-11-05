import 'package:bank_account_picker/bank_account_picker.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';

void main() {
  group('bank_account_form_bloc_tests', () {
    blocTest(
      'test bank_account bloc changed with empty string',
      build: () => BankAccountBloc(),
      act: (bloc) => bloc.add(
        const BankAccountChanged(
          account: BankAccount(accountNumber: ''),
        ),
      ),
      expect: () => [
        const BankAccountState(
          account: BankAccountInput.dirty(''),
          status: FormzStatus.invalid,
        ),
      ],
    );
    blocTest(
      'test bank_account bloc changed with right string',
      build: () => BankAccountBloc(),
      act: (bloc) => bloc.add(
        const BankAccountChanged(
          account: BankAccount(accountNumber: "2133434556"),
        ),
      ),
      expect: () => [
        const BankAccountState(
          account: BankAccountInput.dirty('2133434556'),
          status: FormzStatus.valid,
        ),
      ],
    );
    blocTest(
      'test bank_account unfocused with empty string',
      build: () => BankAccountBloc(),
      act: (bloc) => bloc.add(BankAccountUnfocused()),
      expect: () => [
        const BankAccountState(
          account: BankAccountInput.dirty(''),
          status: FormzStatus.invalid,
        ),
      ],
    );
    blocTest(
      'test bank_account changed with wrong string',
      build: () => BankAccountBloc(),
      act: (bloc) => bloc.add(
        const BankAccountChanged(
          account: BankAccount(accountNumber: "213"),
        ),
      ),
      expect: () => [
        const BankAccountState(
          account: BankAccountInput.dirty('213'),
          status: FormzStatus.invalid,
        ),
      ],
    );
  });
}
