part of 'email_form_bloc.dart';

class EmailFormState extends Equatable {
  const EmailFormState({
    this.email = const EmailInput.pure(),
    this.status = FormzStatus.pure,
  });

  EmailFormState copyWith({
    EmailInput? email,
    FormzStatus? status,
  }) {
    return EmailFormState(
      email: email ?? this.email,
      status: status ?? this.status,
    );
  }

  final EmailInput email;
  final FormzStatus status;

  bool get isValid {
    return status.isValid;
  }

  @override
  List<Object> get props => [email, status];

  @override
  bool get stringify => true;
}
