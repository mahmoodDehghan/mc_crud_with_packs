part of 'fullname_form_bloc.dart';

abstract class FullNameFormEvent extends Equatable {
  const FullNameFormEvent();

  @override
  List<Object> get props => [];
}

class FirstNameChanged extends FullNameFormEvent {
  const FirstNameChanged({
    required this.firstName,
  });

  final String firstName;

  @override
  List<Object> get props => [firstName];
}

class FirstNameUnfocused extends FullNameFormEvent {}

class LastNameChanged extends FullNameFormEvent {
  const LastNameChanged({
    required this.lastName,
  });

  final String lastName;

  @override
  List<Object> get props => [lastName];
}

class LastNameUnfocused extends FullNameFormEvent {}
