import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mc_crud/mc_crud.dart';

class CustomerList extends StatelessWidget {
  const CustomerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CustomerShowBloc, CustomerShowState>(
      builder: (context, state) => state.showMessage.isNotEmpty
          ? Center(
              child: Text(state.showMessage),
            )
          : ListView.builder(
              itemBuilder: (context, index) => CustomerListItem(
                customer: state.allCustomers!.elementAt(index),
              ),
              itemCount: state.allCustomers!.length,
            ),
    );
  }
}
