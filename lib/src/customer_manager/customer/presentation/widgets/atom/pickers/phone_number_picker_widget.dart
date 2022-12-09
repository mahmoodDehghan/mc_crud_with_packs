import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mc_crud/mc_crud.dart';
import 'package:phone_form_field/phone_form_field.dart';

class PhoneNumberPickerWidget extends HookWidget {
  const PhoneNumberPickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneFocus = useFocusNode();
    phoneFocus.addListener(
      () {
        if (!phoneFocus.hasFocus) {
          context.read<PhoneNumberBloc>().add(
                PhoneNumberUnfocused(),
              );
        }
      },
    );
    return BlocBuilder<PhoneNumberBloc, PhoneNumberState>(
        builder: (context, state) {
      return PhoneFormField(
        key: const ValueKey('phone_number'),
        focusNode: phoneFocus,
        decoration: InputDecoration(
          icon: const Icon(Icons.phone_android_rounded),
          helperText: "for auto country start with +",
          errorText: !state.status && !state.pure
              ? state.phoneNumber.nsn.isEmpty
                  ? 'Phone number is Required!'
                  : 'Invalid mobile number'
              : null,
        ),
        validator: PhoneValidator.compose([
          PhoneValidator.required(errorText: 'mobile number is required!'),
          PhoneValidator.validMobile(errorText: 'Invalid mobile number!')
        ]),
        // autovalidateMode: AutovalidateMode.onUserInteraction,
        onChanged: (value) => context.read<PhoneNumberBloc>().add(
              PhoneNumberChanged(
                phoneNumber:
                    value ?? const PhoneNumber(isoCode: IsoCode.US, nsn: ''),
              ),
            ),
        initialValue: state.phoneNumber,
      );
    });
  }
}
