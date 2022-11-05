import 'package:bank_account_picker/src/model/bank_account.dart';
import 'package:bank_account_picker/src/model/bank_account_input.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'bank_account_event.dart';
part 'bank_account_state.dart';

class BankAccountBloc extends Bloc<BankAccountEvent, BankAccountState> {
  BankAccountBloc() : super(const BankAccountState()) {
    on<BankAccountChanged>(_bankAccountChanged);
    on<BankAccountUnfocused>(_bankAccountUnfocused);
  }

  void _bankAccountChanged(
      BankAccountChanged event, Emitter<BankAccountState> emit) {
    final bankAccountInput =
        BankAccountInput.dirty(event.account.accountNumber);
    emit(
      state.copyWith(
        account: bankAccountInput,
        status: Formz.validate([bankAccountInput]),
      ),
    );
  }

  void _bankAccountUnfocused(
      BankAccountUnfocused event, Emitter<BankAccountState> emit) {
    final bankAccountInput = BankAccountInput.dirty(state.account.value);
    emit(
      state.copyWith(
        account: bankAccountInput,
        status: Formz.validate([bankAccountInput]),
      ),
    );
  }
}
