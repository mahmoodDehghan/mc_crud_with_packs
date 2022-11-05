part of 'customer_show_bloc.dart';

abstract class CustomerShowEvent extends Equatable {
  const CustomerShowEvent();

  @override
  List<Object> get props => [];
}

class LoadCustomersList extends CustomerShowEvent {}

class LookForCustomer extends CustomerShowEvent {
  const LookForCustomer(this.id);

  final String id;

  @override
  List<Object> get props => [id];
}

class SetInProgress extends CustomerShowEvent {}

class CustomersListChanged extends CustomerShowEvent {
  const CustomersListChanged({
    required this.customersList,
    required this.message,
  });

  final GeneralResult<List<Customer>> customersList;
  final String message;

  @override
  List<Object> get props => [customersList];
}

class CurrentCustomerChanged extends CustomerShowEvent {
  const CurrentCustomerChanged({
    required this.currentCustomer,
  });

  final GeneralResult<Customer> currentCustomer;

  @override
  List<Object> get props => [currentCustomer];
}

class SetNeedToRefresh extends CustomerShowEvent {}
