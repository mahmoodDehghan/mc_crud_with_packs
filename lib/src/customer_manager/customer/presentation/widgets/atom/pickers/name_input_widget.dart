import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mc_crud/mc_crud.dart';

class NameInputWidget extends HookWidget {
  const NameInputWidget({
    Key? key,
    this.iconData,
    this.helperText,
    this.hintText,
    this.requiredError,
    this.isFirstName = false,
    required this.inputKey,
  }) : super(key: key);

  final String? helperText;
  final String? hintText;
  final IconData? iconData;
  final String? requiredError;
  final bool isFirstName;
  final Key inputKey;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        context.read<FullNameBloc>().add(
              isFirstName ? FirstNameUnfocused() : LastNameUnfocused(),
            );
      }
    });
    return BlocBuilder<FullNameBloc, FullNameFormState>(
      builder: (context, state) {
        return TextFormField(
          key: inputKey,
          initialValue:
              isFirstName ? state.firstName.value : state.lastName.value,
          focusNode: focusNode,
          autovalidateMode: AutovalidateMode.always,
          decoration: InputDecoration(
            icon: Icon(iconData ?? Icons.person),
            hintText: hintText,
            helperText: helperText,
            errorText: ((isFirstName && state.firstName.invalid) ||
                    (!isFirstName && state.lastName.invalid))
                ? requiredError
                : null,
          ),
          keyboardType: TextInputType.text,
          onChanged: (value) {
            context.read<FullNameBloc>().add(
                  isFirstName
                      ? FirstNameChanged(
                          firstName: value,
                        )
                      : LastNameChanged(lastName: value),
                );
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
