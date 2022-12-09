import 'package:mc_crud/mc_crud.dart';

class PersonMapper implements Mapper<PersonDTO, Person> {
  @override
  Person map(PersonDTO input) {
    return Person(
      id: input.id,
      firstName: input.firstName,
      lastName: input.lastName,
      birthDate: input.dateOfBirth,
    );
  }

  @override
  PersonDTO reverse(Person input) {
    return PersonDTO(
      id: input.id,
      firstName: input.firstName,
      lastName: input.lastName,
      dateOfBirth: input.birthDate,
    );
  }
}
