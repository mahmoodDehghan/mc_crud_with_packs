import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:mc_crud/mc_crud.dart';

part 'person_dto.g.dart';

@HiveType(typeId: 1)
class PersonDTO extends HiveObject with EquatableMixin {
  PersonDTO({
    required this.id,
    required this.dateOfBirth,
    required this.firstName,
    required this.lastName,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String firstName;
  @HiveField(2)
  final String lastName;
  @HiveField(3)
  final String dateOfBirth;

  @override
  List<Object> get props => [
        firstName,
        lastName,
        dateOfBirth,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() => {
        JSONKeys.idKey: id,
        JSONKeys.personFirstNameKey: firstName,
        JSONKeys.personLastNameKey: lastName,
        JSONKeys.personBirthDateKey: dateOfBirth,
      };

  factory PersonDTO.fromJson(Map<String, dynamic> json) => PersonDTO(
        id: HashMapUtils.fetchStrictInt(
          json,
          JSONKeys.idKey,
        ),
        firstName: HashMapUtils.fetchStrictString(
          json,
          JSONKeys.personFirstNameKey,
        ),
        lastName: HashMapUtils.fetchStrictString(
          json,
          JSONKeys.personLastNameKey,
        ),
        dateOfBirth: HashMapUtils.fetchStrictString(
          json,
          JSONKeys.personBirthDateKey,
        ),
      );
}
