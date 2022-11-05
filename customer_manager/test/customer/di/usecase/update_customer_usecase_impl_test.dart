import 'package:customer_manager/customer_manager.dart';
import 'package:customer_manager/src/customer/di/init_injection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/hive_test.dart';

void main() {
  group('update a customer usecase test', () {
    setUp(() async {
      configureDependencies();
      await setUpTestHive();
    });
    tearDown(() async {
      await tearDownTestHive();
    });
    test('update a customer', () async {
      final customer = CustomerDTO(
          id: 1,
          person: PersonDTO(
            id: 1,
            firstName: "tim",
            lastName: "baker",
            dateOfBirth: 'September 10, 1989',
          ),
          email: 'mnsd@sdf.com',
          phoneNumber: '+989123458765',
          bankAccountNumber: '1234356');
      final rep = CustomerLocalRespositoryImpl();
      await CreateCustomerUsecaseImpl(rep).createCustomer(customer.toJson());
      final updatedCustomer = CustomerDTO(
        id: customer.id,
        person: customer.person,
        email: customer.email,
        phoneNumber: customer.phoneNumber,
        bankAccountNumber: '1234444444',
      );
      final updateRes = await UpdateCustomerUsecaseImpl(rep).updateCustomer(
        customer.id,
        updatedCustomer.toJson(),
      );
      expect(
        updateRes,
        const GeneralResult(
          result: true,
          errorMessage: '',
        ),
      );
      final res = await GetCustomerUsecaseImpl(rep).getCustomer(1);
      expect(
        res,
        GeneralResult(
          result: CustomerMapper().map(updatedCustomer),
          errorMessage: '',
        ),
      );
    });
  });
}
