import 'package:customer_manager/customer_manager.dart';
import 'package:customer_manager/src/customer/bloc/customer_show/customer_show_bloc.dart';
import 'package:customer_manager/src/customer/presentation/organizer/customer_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomersListPage extends StatelessWidget {
  static const String routeName = '/customers';

  const CustomersListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<CustomerShowBloc>().add(SetInProgress());
    context.read<CustomerShowBloc>().add(LoadCustomersList());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: BlocBuilder<CustomerShowBloc, CustomerShowState>(
          builder: (context, state) => state.isInProgress
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const CustomerList(
                  key: ValueKey('Customer_List'),
                ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<CustomerShowBloc>().add(
                CurrentCustomerChanged(
                  currentCustomer: GeneralResult.successResult<Customer>(
                    Customer.defaultCustomer(),
                  ),
                ),
              );
          context.go(
              '${CustomersListPage.routeName}/${CustomerFormPage.routeName}new');
        },
        child: const Icon(
          Icons.add,
          key: ValueKey('plus'),
        ),
      ),
    );
  }
}
