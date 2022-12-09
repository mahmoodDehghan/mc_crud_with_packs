import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud/mc_crud.dart';

class CustomerDetails extends StatelessWidget {
  const CustomerDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerShowBloc, CustomerShowState>(
      builder: (context, state) => ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            return CustomerDetailItem(
              icon: const Icon(Icons.person),
              label: 'Firstname',
              value: state.currentCustomer!.person.firstName,
            );
          } else if (index == 1) {
            return CustomerDetailItem(
              icon: const Icon(Icons.person_outline),
              label: 'Lastname',
              value: state.currentCustomer!.person.lastName,
            );
          } else if (index == 2) {
            return CustomerDetailItem(
              icon: const Icon(Icons.cake),
              label: 'BirthDate',
              value: state.currentCustomer!.person.birthDate,
            );
          } else if (index == 3) {
            return CustomerDetailItem(
              icon: const Icon(Icons.mail),
              label: 'Email',
              value: state.currentCustomer!.email,
            );
          } else if (index == 4) {
            return CustomerDetailItem(
              icon: const Icon(Icons.phone_android),
              label: 'Phone',
              value: state.currentCustomer!.phone,
            );
          } else if (index == 5) {
            return CustomerDetailItem(
              icon: const Icon(Icons.money),
              label: 'Bankaccount',
              value: state.currentCustomer!.bankAccountNumber,
            );
          }
          return Container();
        },
        itemCount: 6,
      ),
    );
  }
}
