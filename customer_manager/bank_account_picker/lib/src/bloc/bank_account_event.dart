part of 'bank_account_bloc.dart';

abstract class BankAccountEvent extends Equatable {
  const BankAccountEvent();

  @override
  List<Object> get props => [];
}

class BankAccountChanged extends BankAccountEvent {
  const BankAccountChanged({required this.account});

  final BankAccount account;

  @override
  List<Object> get props => [account];
}

class BankAccountUnfocused extends BankAccountEvent {}
