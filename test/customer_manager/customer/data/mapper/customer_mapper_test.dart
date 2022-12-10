import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud/mc_crud.dart';

void main() {
  group('customer mapper class test', () {
    test('mapper test', () {
      final res = CustomerMapper().map(
        CustomerDTO(
          id: 1,
          person: PersonDTO(
            id: 1,
            birthYear: 1998,
            birthMonth: 4,
            birthDay: 13,
            firstName: 'eddy',
            lastName: 'morphy',
          ),
          email: 'test@test.com',
          phoneNumber: 9127606447,
          bankAccountNumber: 'IR110570033780012625008101',
        ),
      );
      expect(
        res,
        const Customer(
          id: 1,
          person: Person(
              id: 1,
              firstName: 'eddy',
              lastName: 'morphy',
              birthDate: 'April 13, 1998'),
          email: 'test@test.com',
          phone: '+9127606447',
          bankAccountNumber: 'IR110570033780012625008101',
        ),
      );
    });
    test('reverse test', () {
      final res = CustomerMapper().reverse(
        const Customer(
          id: 1,
          person: Person(
              id: 1,
              firstName: 'eddy',
              lastName: 'morphy',
              birthDate: 'April 13, 1998'),
          email: 'test@test.com',
          phone: '+9127606447',
          bankAccountNumber: 'IR110570033780012625008101',
        ),
      );
      expect(
        res,
        CustomerDTO(
          id: 1,
          person: PersonDTO(
            id: 1,
            birthYear: 1998,
            birthMonth: 4,
            birthDay: 13,
            firstName: 'eddy',
            lastName: 'morphy',
          ),
          email: 'test@test.com',
          phoneNumber: 9127606447,
          bankAccountNumber: 'IR110570033780012625008101',
        ),
      );
    });
  });
}
