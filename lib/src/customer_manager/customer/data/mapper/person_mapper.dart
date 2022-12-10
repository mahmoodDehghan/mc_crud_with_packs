import 'package:mc_crud/mc_crud.dart';

class PersonMapper implements Mapper<PersonDTO, Person> {
  @override
  Person map(PersonDTO input) {
    return Person(
      id: input.id,
      firstName: input.firstName,
      lastName: input.lastName,
      birthDate: BirthDate(
          birthDate: DateTime(
        input.birthYear!,
        input.birthMonth!,
        input.birthDay!,
      )).birthDateString,
    );
  }

  @override
  PersonDTO reverse(Person input) {
    final date = BirthDate.fromString(input.birthDate);
    return PersonDTO(
      id: input.id,
      firstName: input.firstName,
      lastName: input.lastName,
      birthYear: date.birthDate.year,
      birthMonth: date.birthDate.month,
      birthDay: date.birthDate.day,
    );
  }
}
