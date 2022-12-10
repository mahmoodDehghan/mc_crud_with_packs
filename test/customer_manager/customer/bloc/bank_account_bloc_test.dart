import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mc_crud/mc_crud.dart';

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
          account: BankAccount(accountNumber: "ir110570033780012625008101"),
        ),
      ),
      expect: () => [
        const BankAccountState(
          account: BankAccountInput.dirty('ir110570033780012625008101'),
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
