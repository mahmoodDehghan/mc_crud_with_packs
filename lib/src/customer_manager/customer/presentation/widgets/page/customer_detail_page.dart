import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:mc_crud/mc_crud.dart';

class CustomerDetailPage extends StatelessWidget {
  static const String routeName = 'customer/';

  const CustomerDetailPage({
    Key? key,
    required this.cid,
  }) : super(key: key);

  final String cid;

  @override
  Widget build(BuildContext context) {
    context.read<CustomerShowBloc>().add(SetInProgress());
    context.read<CustomerShowBloc>().add(LookForCustomer(cid));
    return Scaffold(
      appBar: AppBar(
        title: Text('Customer $cid'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: BlocBuilder<CustomerShowBloc, CustomerShowState>(
            builder: (context, state) {
          return state.isInProgress
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const CustomerDetails();
        }),
      ),
    );
  }
}
