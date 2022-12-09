import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud/mc_crud.dart';

class CustomerShowBlocProvider extends StatelessWidget {
  const CustomerShowBlocProvider(this.appWidget, {super.key});

  final Widget appWidget;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CustomerShowBloc(),
      child: appWidget,
    );
  }
}
