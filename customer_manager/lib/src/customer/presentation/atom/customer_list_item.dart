import 'package:customer_manager/customer_manager.dart';
import 'package:customer_manager/src/customer/bloc/customer_show/customer_show_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CustomerListItem extends StatelessWidget {
  const CustomerListItem({
    Key? key,
    required this.customer,
  }) : super(key: key);

  final Customer customer;

  @override
  Widget build(BuildContext context) {
    final formBloc = context.read<CustomerFormBloc>();
    final showBloc = context.read<CustomerShowBloc>();
    return InkWell(
      onTap: () => context.go(
          '${CustomersListPage.routeName}/${CustomerDetailPage.routeName}${customer.id}/'),
      child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                  key: ValueKey("list_item${customer.id}"),
                  '${customer.id} : ${customer.person.firstName} ${customer.person.lastName}'),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      context.go(
                          '${CustomersListPage.routeName}/${CustomerFormPage.routeName}${customer.id}');
                    },
                    icon: const Icon(
                      Icons.mode_edit_outline,
                      key: ValueKey(
                        'customer_edit',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      final confirm = await showDialog<bool>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('confirm'),
                            content: const Text(
                              'Are you sure?',
                              key: ValueKey('confirm'),
                            ),
                            actions: [
                              ElevatedButton(
                                key: const ValueKey('customer_delete_yes'),
                                onPressed: () {
                                  Navigator.of(context).pop(true);
                                },
                                child: const Text('yes'),
                              ),
                              ElevatedButton(
                                key: const ValueKey('customer_delete_no'),
                                onPressed: () {
                                  Navigator.of(context).pop(false);
                                },
                                child: const Text('no'),
                              ),
                            ],
                          );
                        },
                      );
                      if (confirm!) {
                        formBloc.add(
                          CustomerDeleteConfirmed(
                            id: customer.id.toString(),
                          ),
                        );
                        showBloc.add(SetInProgress());
                        showBloc.add(LoadCustomersList());
                      }
                    },
                    icon: const Icon(Icons.delete,
                        key: ValueKey(
                          'customer_delete',
                        )),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
