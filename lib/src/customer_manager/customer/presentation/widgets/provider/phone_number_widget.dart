import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud/mc_crud.dart';

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
