part of 'fullname_form_bloc.dart';

class FullNameFormState extends Equatable {
  FullNameFormState({
    this.firstName = const FirstNameInput.pure(''),
    this.lastName = const LastNameInput.pure(''),
    this.status = FormzStatus.pure,
  }) : super() {
    fullName = FullName(firstName: firstName.value, lastName: lastName.value);
  }

  final FirstNameInput firstName;
  final LastNameInput lastName;
  late final FullName fullName;
  final FormzStatus status;

  bool get isValid => status == FormzStatus.valid;

  FullNameFormState copyWith({
    FirstNameInput? firstName,
    LastNameInput? lastName,
    FormzStatus? status,
  }) {
    return FullNameFormState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [firstName, lastName, status];

  @override
  bool get stringify => true;
}
