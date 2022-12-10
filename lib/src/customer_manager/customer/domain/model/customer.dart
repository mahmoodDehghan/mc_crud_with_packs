import 'package:equatable/equatable.dart';
import 'package:mc_crud/mc_crud.dart';

class Customer extends Equatable {
  const Customer({
    required this.id,
    required this.email,
    required this.bankAccountNumber,
    required this.person,
    required this.phone,
  });

  factory Customer.defaultCustomer() {
    return const Customer(
      id: -1,
      email: '',
      bankAccountNumber: '',
      person: Person(
        id: -1,
        firstName: '',
        lastName: '',
        birthDate: '',
      ),
      phone: '',
    );
  }

  factory Customer.id(int cid) {
    return Customer(
      id: cid,
      email: '',
      bankAccountNumber: '',
      person: Person(
        id: cid,
        firstName: '',
        lastName: '',
        birthDate: '',
      ),
      phone: '',
    );
  }

  final int id;
  final String email;
  final Person person;
  final String phone;
  final String bankAccountNumber;

  @override
  List<Object> get props => [email, person, bankAccountNumber, phone, id];

  @override
  bool get stringify => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Customer &&
          email.toLowerCase() == other.email.toLowerCase() &&
          person == other.person &&
          bankAccountNumber.toLowerCase() ==
              other.bankAccountNumber.toLowerCase() &&
          phone == other.phone &&
          id == other.id;

  @override
  int get hashCode =>
      email.toLowerCase().hashCode +
      person.hashCode +
      bankAccountNumber.hashCode +
      phone.hashCode +
      id.hashCode;
}
