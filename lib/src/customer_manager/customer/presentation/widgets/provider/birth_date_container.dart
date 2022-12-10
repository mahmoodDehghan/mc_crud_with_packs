import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud/mc_crud.dart';

class BirthDateContainer extends StatelessWidget {
  const BirthDateContainer({
    super.key,
    this.hasBloc = false,
  });

  final bool hasBloc;

  @override
  Widget build(BuildContext context) {
    return hasBloc
        ? const BirthDatePickerWidget()
        : BlocProvider(
            create: (context) => BirthDatePickerBloc(),
            child: const BirthDatePickerWidget(),
          );
  }
}
