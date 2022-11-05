import 'package:customer_manager/customer_manager.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('mapper utils test', () {
    test('customer map to result', () {
      final customer = CustomerDTO(
        id: 1,
        person: PersonDTO(
          id: 1,
          firstName: 'asghar',
          lastName: 'asghari',
          dateOfBirth: 'June 12, 1890',
        ),
        email: 'email@email.com',
        phoneNumber: '+91223456788',
        bankAccountNumber: '12345',
      );
      expect(
        MapperUtils.mapResult(customer),
        GeneralResult(
          result: CustomerMapper().map(customer),
          errorMessage: '',
        ),
      );
    });
    test('customers map to results', () {
      final customerList = [
        CustomerDTO(
          id: 1,
          person: PersonDTO(
            id: 1,
            firstName: 'asghar',
            lastName: 'asghari',
            dateOfBirth: 'June 12, 1890',
          ),
          email: 'email@email.com',
          phoneNumber: '+91223456788',
          bankAccountNumber: '12345',
        )
      ];
      final cList = customerList
          .map(
            (e) => CustomerMapper().map(e),
          )
          .toList();
      expect(
        MapperUtils.mapResults(customerList),
        GeneralResult(
          result: cList,
          errorMessage: '',
        ),
      );
    });
  });
}
