import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:fullname_picker/fullname_picker.dart';

class LastNameInputWidget extends HookWidget {
  const LastNameInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lastNameFocus = useFocusNode();
    lastNameFocus.addListener(
      () {
        if (!lastNameFocus.hasFocus) {
          context.read<FullNameBloc>().add(
                LastNameUnfocused(),
              );
        }
      },
    );
    return BlocBuilder<FullNameBloc, FullNameFormState>(
      builder: (context, state) {
        return TextFormField(
          key: const ValueKey('lastName'),
          initialValue: state.lastName.value,
          focusNode: lastNameFocus,
          autovalidateMode: AutovalidateMode.always,
          decoration: InputDecoration(
            icon: const Icon(Icons.person),
            helperText: "e.g. dehghan",
            errorText: state.lastName.invalid ? "LastName is Required!" : null,
          ),
          keyboardType: TextInputType.text,
          onChanged: (value) {
            context.read<FullNameBloc>().add(
                  LastNameChanged(
                    lastName: value,
                  ),
                );
          },
          textInputAction: TextInputAction.next,
        );
      },
    );
  }
}
