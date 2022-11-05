part of 'customer_show_bloc.dart';

enum CustomerShowStatus { init, fail, pending, success }

class CustomerShowState extends Equatable {
  const CustomerShowState({
    this.currentCustomer = const Customer(
      id: -1,
      person: Person(id: -1, firstName: '', lastName: '', birthDate: ''),
      email: '',
      phone: '',
      bankAccountNumber: '',
    ),
    this.allCustomers = const <Customer>[],
    this.showMessage = '',
    this.status = CustomerShowStatus.init,
    this.needToRefresh = false,
  });

  final Customer? currentCustomer;
  final List<Customer>? allCustomers;
  final String showMessage;
  final CustomerShowStatus status;
  final bool needToRefresh;

  CustomerShowState copyWith({
    Customer? currentCustomer,
    List<Customer>? allCustomers,
    CustomerShowStatus? status,
    String? showMessage,
    bool? needToRefresh,
  }) {
    return CustomerShowState(
      currentCustomer: currentCustomer ?? this.currentCustomer,
      allCustomers: allCustomers ?? this.allCustomers,
      showMessage: showMessage ?? this.showMessage,
      status: status ?? this.status,
      needToRefresh: needToRefresh ?? false,
    );
  }

  bool get isInProgress {
    return status == CustomerShowStatus.pending;
  }

  @override
  List<Object> get props => [
        currentCustomer!,
        allCustomers!,
        showMessage,
        status,
      ];

  @override
  bool get stringify => true;
}
