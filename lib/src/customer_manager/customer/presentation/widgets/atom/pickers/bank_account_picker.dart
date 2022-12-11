import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mc_crud/mc_crud.dart';

class BankAccountPicker extends HookWidget {
  const BankAccountPicker({
    Key? key,
    this.requiredError,
    this.wrongError,
    this.icon,
    this.helperText,
  }) : super(key: key);

  final String? requiredError;
  final String? wrongError;
  final IconData? icon;
  final String? helperText;

  @override
  Widget build(BuildContext context) {
    final bankAccountFocus = useFocusNode();
    bankAccountFocus.addListener(
      () {
        if (!bankAccountFocus.hasFocus) {
          context.read<BankAccountBloc>().add(
                BankAccountUnfocused(),
              );
        }
      },
    );
    return BlocBuilder<BankAccountBloc, BankAccountState>(
      builder: (context, state) => TextFormField(
        key: const ValueKey('bank_account'),
        initialValue: state.account.value,
        focusNode: bankAccountFocus,
        autovalidateMode: AutovalidateMode.always,
        decoration: InputDecoration(
          icon: const Icon(Icons.attach_money),
          helperText: "e.g. IR**********************",
          hintText: 'bankAccountNumber',
          errorText: state.account.invalid
              ? state.account.value.isEmpty
                  ? requiredError ?? "Bank Account is Required!"
                  : wrongError ??
                      'Please ensure the Bank Account entered is valid(IBAN)!'
              : null,
        ),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          context.read<BankAccountBloc>().add(
                BankAccountChanged(
                  account: BankAccount(
                    accountNumber: value,
                  ),
                ),
              );
        },
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
