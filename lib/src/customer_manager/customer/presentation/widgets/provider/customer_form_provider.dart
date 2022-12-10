import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud/mc_crud.dart';

class CustomerFormProvider extends StatelessWidget {
  const CustomerFormProvider({
    super.key,
    required this.cid,
  });

  final String cid;

  @override
  Widget build(BuildContext context) {
    context.read<CustomerFormBloc>().add(SetFormInProgress());
    context.read<CustomerFormBloc>().add(SetCustomer(id: cid));
    return CustomerForm();
  }
}
