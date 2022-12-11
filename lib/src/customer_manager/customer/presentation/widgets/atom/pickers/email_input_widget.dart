import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mc_crud/mc_crud.dart';

class EmailInputWidget extends HookWidget {
  const EmailInputWidget({
    Key? key,
    this.hasBloc = false,
    this.helperText,
    this.requiredError,
    this.wrongError,
    this.icon,
    this.inputKey,
  }) : super(key: key);

  final bool hasBloc;
  final Key? inputKey;
  final IconData? icon;
  final String? helperText;
  final String? requiredError;
  final String? wrongError;

  Widget _getField(BuildContext context) {
    final emailFocus = useFocusNode();
    emailFocus.addListener(
      () {
        if (!emailFocus.hasFocus) {
          context.read<EmailBloc>().add(
                EmailUnfocused(),
              );
        }
      },
    );
    return BlocBuilder<EmailBloc, EmailFormState>(
      builder: (context, state) {
        return TextFormField(
          key: inputKey ?? const ValueKey('email'),
          initialValue: state.email.value,
          focusNode: emailFocus,
          autovalidateMode: AutovalidateMode.always,
          decoration: InputDecoration(
            icon: Icon(icon ?? Icons.email),
            helperText: helperText ?? "e.g. mdm@gmail.com",
            hintText: 'email',
            errorText: state.email.invalid
                ? state.email.value.isEmpty
                    ? requiredError ?? "Email is Required!"
                    : wrongError ?? 'Please ensure the email entered is valid!'
                : null,
          ),
          keyboardType: TextInputType.emailAddress,
          onChanged: (value) {
            context.read<EmailBloc>().add(
                  EmailChanged(
                    email: Email(emailString: value),
                  ),
                );
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return hasBloc
        ? _getField(context)
        : BlocProvider(
            create: (context) => EmailBloc(),
            child: _getField(context),
          );
  }
}
