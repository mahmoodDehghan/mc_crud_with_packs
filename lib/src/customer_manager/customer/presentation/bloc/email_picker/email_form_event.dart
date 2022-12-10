part of 'email_form_bloc.dart';

abstract class EmailFormEvent extends Equatable {
  const EmailFormEvent();

  @override
  List<Object> get props => [];
}

class EmailChanged extends EmailFormEvent {
  const EmailChanged({required this.email});

  final Email email;

  @override
  List<Object> get props => [email];
}

class EmailUnfocused extends EmailFormEvent {}
