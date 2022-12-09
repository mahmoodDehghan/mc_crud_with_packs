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
  @HiveField(2)
  final String phoneNumber;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String bankAccountNumber;

  factory CustomerDTO.fromJson(Map<String, dynamic> json) => CustomerDTO(
        id: HashMapUtils.fetchStrictInt(json, JSONKeys.idKey),
        person: PersonDTO.fromJson(
            json[JSONKeys.personKey] as Map<String, dynamic>),
        email: HashMapUtils.fetchStrictString(json, JSONKeys.emailKey),
        phoneNumber: HashMapUtils.fetchStrictString(json, JSONKeys.phoneKey),
        bankAccountNumber:
            HashMapUtils.fetchStrictString(json, JSONKeys.bankAccountKey),
      );

  Map<String, dynamic> toJson() => {
        JSONKeys.idKey: id,
        JSONKeys.emailKey: email,
        JSONKeys.personKey: person.toJson(),
        JSONKeys.phoneKey: phoneNumber,
        JSONKeys.bankAccountKey: bankAccountNumber,
      };

  @override
  List<Object> get props => [
        person,
      ];

  @override
  bool get stringify => true;
}
