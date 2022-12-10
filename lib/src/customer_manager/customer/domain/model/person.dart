import 'package:equatable/equatable.dart';

class Person extends Equatable {
  const Person({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.birthDate,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String birthDate;

  @override
  List<Object> get props => [firstName, lastName, birthDate];

  @override
  bool get stringify => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Person &&
          firstName.toLowerCase() == other.firstName.toLowerCase() &&
          lastName.toLowerCase() == other.lastName.toLowerCase() &&
          birthDate == other.birthDate;

  @override
  int get hashCode =>
      firstName.toLowerCase().hashCode +
      lastName.toLowerCase().hashCode +
      birthDate.hashCode;
}
