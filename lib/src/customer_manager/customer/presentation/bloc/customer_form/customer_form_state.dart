part of 'customer_form_bloc.dart';

enum CustomerFormStatus { init, fieldInit, failed, pending, success }

class CustomerFormState extends Equatable {
  const CustomerFormState({
    this.customer = const Customer(
      id: -1,
      person: Person(id: -1, firstName: '', lastName: '', birthDate: ''),
      email: '',
      phone: '',
      bankAccountNumber: '',
    ),
    this.status = CustomerFormStatus.init,
    this.formMessage = '',
    this.isUpdate = false,
  });

  final Customer? customer;
  final CustomerFormStatus status;
  final String formMessage;
  final bool isUpdate;

  bool get isInPending {
    return status == CustomerFormStatus.pending;
  }

  bool get isFieldsInit {
    return status == CustomerFormStatus.fieldInit;
  }

  bool get isFailed {
    return status == CustomerFormStatus.failed;
  }

  bool get isDoneRight {
    return status == CustomerFormStatus.success;
  }

  CustomerFormState copyWith({
    Customer? customer,
    String? formMessage,
    CustomerFormStatus? status,
    bool? isUpdate,
  }) {
    return CustomerFormState(
      customer: customer ?? this.customer,
      status: status ?? this.status,
      formMessage: formMessage ?? this.formMessage,
      isUpdate: isUpdate ?? this.isUpdate,
    );
  }

  @override
  List<Object> get props => [
        status,
        formMessage,
        customer!,
        isUpdate,
      ];

  @override
  bool get stringify => true;
}
