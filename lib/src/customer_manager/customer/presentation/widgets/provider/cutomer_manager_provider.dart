import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud/mc_crud.dart';

class CustomerManager extends StatelessWidget {
  const CustomerManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CustomerShowBloc(),
        ),
        BlocProvider(
          create: (context) => CustomerFormBloc(),
        )
      ],
      child: const CustomersListPage(),
    );
  }
}
