part of 'bank_account_bloc.dart';

class BankAccountState extends Equatable {
  const BankAccountState({
    this.account = const BankAccountInput.pure(),
    this.status = FormzStatus.pure,
  });

  final BankAccountInput account;
  final FormzStatus status;

  bool get isValid => status.isValid;

  BankAccountState copyWith({
    BankAccountInput? account,
    FormzStatus? status,
  }) {
    return BankAccountState(
      account: account ?? this.account,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        account,
        status,
      ];

  @override
  bool get stringify => true;
}
