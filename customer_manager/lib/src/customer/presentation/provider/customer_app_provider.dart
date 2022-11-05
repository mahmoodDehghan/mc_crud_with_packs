import 'package:customer_manager/customer_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
