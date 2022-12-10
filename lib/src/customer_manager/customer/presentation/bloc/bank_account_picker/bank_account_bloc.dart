import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:mc_crud/mc_crud.dart';

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
