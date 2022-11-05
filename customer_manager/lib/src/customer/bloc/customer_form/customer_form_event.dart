part of 'customer_form_bloc.dart';

abstract class CustomerFormEvent extends Equatable {
  const CustomerFormEvent();

  @override
  List<Object> get props => [];
}

class SetFormInProgress extends CustomerFormEvent {}

class CustomerCreateSubmitted extends CustomerFormEvent {
  const CustomerCreateSubmitted({
    required this.entry,
    this.entryStatus = false,
    this.errMessage = '',
  });

  final Map<String, dynamic> entry;
  final bool entryStatus;
  final String errMessage;

  @override
  List<Object> get props => [entry, entryStatus, errMessage];
}

class CustomerUpdateSubmitted extends CustomerFormEvent {
  const CustomerUpdateSubmitted({
    required this.entry,
    required this.id,
    this.entryStatus = false,
    this.errMessage = '',
  });

  final Map<String, dynamic> entry;
  final String id;
  final bool entryStatus;
  final String errMessage;

  @override
  List<Object> get props => [entry, entryStatus, errMessage, id];
}

class SetCustomer extends CustomerFormEvent {
  const SetCustomer({
    required this.id,
  });

  final String id;

  @override
  List<Object> get props => [id];
}

class CustomerDeleteConfirmed extends CustomerFormEvent {
  const CustomerDeleteConfirmed({
    required this.id,
  });

  final String id;

  @override
  List<Object> get props => [id];
}

class SetInitState extends CustomerFormEvent {}
