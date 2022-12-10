import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/hive_test.dart';
import 'package:mc_crud/mc_crud.dart';

void main() {
  group('delete a customer usecase test', () {
    setUp(() async {
      configureDependencies();
      await setUpTestHive();
    });
    tearDown(() async {
      await tearDownTestHive();
    });
    test('delete a customer', () async {
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
      final rep = CustomerLocalRespositoryImpl();
      await CreateCustomerUsecaseImpl(rep).createCustomer(customer.toJson());
      final res = await GetAllCustomerUseCaseImpl(rep).getCustomersList();
      expect(
        res,
        GeneralResult(
          result: [CustomerMapper().map(customer)],
          errorMessage: '',
        ),
      );
      await DeleteCustomerUsecaseImpl(rep).deleteCustomer(customer.id);
      final res2 = await GetAllCustomerUseCaseImpl(rep).getCustomersList();
      expect(
        res2,
        const GeneralResult(
          result: <Customer>[],
          errorMessage: '',
        ),
      );
    });
  });
}
