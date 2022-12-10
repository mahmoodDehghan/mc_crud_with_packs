import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mc_crud/mc_crud.dart';

part 'customer_dto.g.dart';

@HiveType(typeId: 2)
class CustomerDTO extends HiveObject with EquatableMixin {
  CustomerDTO({
    required this.id,
    required this.person,
    required this.email,
    required this.phoneNumber,
    required this.bankAccountNumber,
  }) : super();

  @HiveField(0)
  final int id;
  @HiveField(1)
  final PersonDTO person;
  @HiveField(5)
  final int? phoneNumber;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String bankAccountNumber;

  factory CustomerDTO.fromJson(Map<String, dynamic> json) => CustomerDTO(
        id: HashMapUtils.fetchStrictInt(json, JSONKeys.idKey),
        person: PersonDTO.fromJson(
            json[JSONKeys.personKey] as Map<String, dynamic>),
        email: HashMapUtils.fetchStrictString(json, JSONKeys.emailKey),
        phoneNumber: HashMapUtils.fetchStrictInt(json, JSONKeys.phoneKey),
        bankAccountNumber:
            HashMapUtils.fetchStrictString(json, JSONKeys.bankAccountKey),
      );

  CustomerDTO toLower() {
    return CustomerDTO(
        id: id,
        person: person.toLower(),
        email: email.toLowerCase(),
        phoneNumber: phoneNumber!,
        bankAccountNumber: bankAccountNumber.toLowerCase());
  }

  Map<String, dynamic> toJson() => {
        JSONKeys.idKey: id,
        JSONKeys.emailKey: email,
        JSONKeys.personKey: person.toJson(),
        JSONKeys.phoneKey: phoneNumber,
        JSONKeys.bankAccountKey: bankAccountNumber,
      };

  @override
  List<Object> get props =>
      [person, email, bankAccountNumber, phoneNumber!, id];

  @override
  bool get stringify => true;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CustomerDTO &&
          email.toLowerCase() == other.email.toLowerCase() &&
          bankAccountNumber.toLowerCase() ==
              other.bankAccountNumber.toLowerCase() &&
          person == other.person &&
          phoneNumber == other.phoneNumber &&
          id == other.id;

  @override
  int get hashCode =>
      email.toLowerCase().hashCode +
      bankAccountNumber.toLowerCase().hashCode +
      person.hashCode +
      phoneNumber.hashCode +
      id.hashCode;
}
