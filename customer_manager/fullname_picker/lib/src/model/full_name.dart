import 'package:equatable/equatable.dart';

class FullName extends Equatable {
  const FullName({
    required this.firstName,
    required this.lastName,
  })  : fullName = "$firstName $lastName",
        super();

  final String firstName;
  final String lastName;
  final String fullName;

  @override
  List<Object> get props => [fullName];

  @override
  bool get stringify => true;
}
