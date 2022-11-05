import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fullname_picker/fullname_picker.dart';

class FirstNameInputWidget extends HookWidget {
  const FirstNameInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstNameFocus = useFocusNode();
    firstNameFocus.addListener(
      () {
        if (!firstNameFocus.hasFocus) {
          context.read<FullNameBloc>().add(
                FirstNameUnfocused(),
              );
        }
      },
    );
    return BlocBuilder<FullNameBloc, FullNameFormState>(
      builder: (context, state) {
        return TextFormField(
          key: const ValueKey('firstName'),
          initialValue: state.firstName.value,
          focusNode: firstNameFocus,
          autovalidateMode: AutovalidateMode.always,
          decoration: InputDecoration(
            icon: const Icon(Icons.person),
            helperText: "e.g. mahmood",
            errorText:
                state.firstName.invalid ? "FirstName is Required!" : null,
          ),
          keyboardType: TextInputType.text,
          onChanged: (value) {
            context.read<FullNameBloc>().add(
                  FirstNameChanged(
                    firstName: value,
                  ),
                );
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
