import 'package:customer_manager/customer_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
