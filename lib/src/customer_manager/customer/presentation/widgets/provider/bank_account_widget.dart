import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud/mc_crud.dart';

class BankAccountWidget extends StatelessWidget {
  const BankAccountWidget(
      {super.key,
      this.hasBloc = false,
      this.helperText,
      this.icon,
      this.inputKey,
      this.requiredError,
      this.wrongError});

  final bool hasBloc;
  final Key? inputKey;
  final IconData? icon;
  final String? helperText;
  final String? requiredError;
  final String? wrongError;

  @override
  Widget build(BuildContext context) {
    return hasBloc
        ? BankAccountPicker(
            helperText: helperText,
            wrongError: wrongError,
            requiredError: requiredError,
            icon: icon,
            key: inputKey,
          )
        : BlocProvider(
            create: (context) => BankAccountBloc(),
            child: BankAccountPicker(
              helperText: helperText,
              wrongError: wrongError,
              requiredError: requiredError,
              icon: icon,
              key: inputKey,
            ),
          );
  }
}
