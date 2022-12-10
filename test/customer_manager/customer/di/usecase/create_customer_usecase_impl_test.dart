import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/hive_test.dart';
import 'package:mc_crud/mc_crud.dart';

void main() {
  group('create a customer usecase test', () {
    setUp(() async {
      configureDependencies();
      await setUpTestHive();
    });
    tearDown(() async {
      await tearDownTestHive();
    });
    test('create a customer', () async {
      final customer = CustomerDTO(
          id: 1,
          person: PersonDTO(
            id: 1,
            firstName: "tim",
            lastName: "baker",
            birthYear: 1989,
            birthMonth: 10,
            birthDay: 10,
          ),
          email: 'mnsd@sdf.com',
          phoneNumber: 989123458765,
          bankAccountNumber: 'IR110570033780012625008101');
      expect(
        await CreateCustomerUsecaseImpl(CustomerLocalRespositoryImpl())
            .createCustomer(customer.toJson()),
        GeneralResult(
          result: CustomerMapper().map(customer),
          errorMessage: '',
        ),
      );
    });
  });
}
