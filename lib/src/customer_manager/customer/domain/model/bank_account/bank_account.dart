import 'package:equatable/equatable.dart';

class BankAccount extends Equatable {
  const BankAccount({required this.accountNumber});

  final String accountNumber;

  @override
  List<Object> get props => [accountNumber];

  @override
  bool get stringify => true;
}
