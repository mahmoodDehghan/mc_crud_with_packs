import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_number_picker/phone_number_picker.dart';
import 'package:phone_number_picker/src/presentation/widget/atom/phone_number_picker_widget.dart';

class PhoneNumberWidget extends StatelessWidget {
  const PhoneNumberWidget({
    super.key,
    this.hasBloc = false,
  });

  final bool hasBloc;

  @override
  Widget build(BuildContext context) {
    return hasBloc
        ? const PhoneNumberPickerWidget()
        : BlocProvider(
            create: (ctx) => PhoneNumberBloc(),
            child: const PhoneNumberPickerWidget(),
          );
  }
}
