import 'package:customer_manager/customer_manager.dart';
import 'package:customer_manager/src/customer/bloc/customer_show/customer_show_bloc.dart';
import 'package:customer_manager/src/customer/presentation/atom/customer_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
