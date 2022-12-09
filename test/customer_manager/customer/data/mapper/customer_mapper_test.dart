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
            dateOfBirth: 'April 13,1998',
            firstName: 'eddy',
            lastName: 'morphy',
          ),
          email: 'test@test.com',
          phoneNumber: '+12345678995',
          bankAccountNumber: '243345466768',
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
              birthDate: 'April 13,1998'),
          email: 'test@test.com',
          phone: '+12345678995',
          bankAccountNumber: '243345466768',
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
              birthDate: 'April 13,1998'),
          email: 'test@test.com',
          phone: '+12345678995',
          bankAccountNumber: '243345466768',
        ),
      );
      expect(
        res,
        CustomerDTO(
          id: 1,
          person: PersonDTO(
            id: 1,
            dateOfBirth: 'April 13,1998',
            firstName: 'eddy',
            lastName: 'morphy',
          ),
          email: 'test@test.com',
          phoneNumber: '+12345678995',
          bankAccountNumber: '243345466768',
        ),
      );
    });
  });
}
