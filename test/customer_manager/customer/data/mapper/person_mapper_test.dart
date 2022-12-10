import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud/mc_crud.dart';

void main() {
  group('person mapper class test', () {
    test('mapper test', () {
      final res = PersonMapper().map(
        PersonDTO(
            id: 1,
            birthYear: 1998,
            birthMonth: 4,
            birthDay: 13,
            firstName: 'tom',
            lastName: 'bradly'),
      );
      expect(
        res,
        const Person(
          id: 1,
          firstName: 'tom',
          lastName: 'bradly',
          birthDate: 'April 13, 1998',
        ),
      );
    });
    test('reverse test', () {
      final res = PersonMapper().reverse(
        const Person(
          id: 1,
          firstName: 'tom',
          lastName: 'bradly',
          birthDate: 'April 13, 1998',
        ),
      );
      expect(
        res,
        PersonDTO(
            id: 1,
            birthYear: 1998,
            birthMonth: 4,
            birthDay: 13,
            firstName: 'tom',
            lastName: 'bradly'),
      );
    });
  });
}
