import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:mc_crud/mc_crud.dart';

part 'person_dto.g.dart';

@HiveType(typeId: 1)
class PersonDTO extends HiveObject with EquatableMixin {
  PersonDTO({
    required this.id,
    required this.birthDay,
    required this.birthMonth,
    required this.birthYear,
    required this.firstName,
    required this.lastName,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String firstName;
  @HiveField(2)
  final String lastName;
  @HiveField(4)
  final int? birthYear;
  @HiveField(5)
  final int? birthMonth;
  @HiveField(6)
  final int? birthDay;

  @override
  List<Object> get props => [
        firstName,
        lastName,
        birthDay!,
        birthMonth!,
        birthYear!,
      ];

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() => {
        JSONKeys.idKey: id,
        JSONKeys.personFirstNameKey: firstName,
        JSONKeys.personLastNameKey: lastName,
        JSONKeys.personBirthYear: birthYear,
        JSONKeys.personBirthMonth: birthMonth,
        JSONKeys.personBirthDay: birthDay,
      };

  PersonDTO toLower() {
    return PersonDTO(
      id: id,
      birthYear: birthYear,
      birthDay: birthDay,
      birthMonth: birthMonth,
      firstName: firstName.toLowerCase(),
      lastName: lastName.toLowerCase(),
    );
  }

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
        birthDay: HashMapUtils.fetchStrictInt(
          json,
          JSONKeys.personBirthDay,
        ),
        birthYear: HashMapUtils.fetchStrictInt(
          json,
          JSONKeys.personBirthYear,
        ),
        birthMonth: HashMapUtils.fetchStrictInt(
          json,
          JSONKeys.personBirthMonth,
        ),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonDTO &&
          firstName.toLowerCase() == other.firstName.toLowerCase() &&
          lastName.toLowerCase() == other.lastName.toLowerCase() &&
          birthYear == other.birthYear &&
          birthMonth == other.birthMonth &&
          birthDay == other.birthDay;

  @override
  int get hashCode =>
      firstName.toLowerCase().hashCode +
      lastName.toLowerCase().hashCode +
      birthYear.hashCode +
      birthMonth.hashCode +
      birthDay.hashCode;
}
