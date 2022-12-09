import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/hive_test.dart';
import 'package:mc_crud/mc_crud.dart';

void main() {
  group('get all customers usecase test', () {
    setUp(() async {
      configureDependencies();
      await setUpTestHive();
    });
    tearDown(() async {
      await tearDownTestHive();
    });
    test('get all customers', () async {
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
      final res = await GetAllCustomerUseCaseImpl(rep).getCustomersList();
      expect(
        res,
        GeneralResult(
          result: [CustomerMapper().map(customer)],
          errorMessage: '',
        ),
      );
    });
  });
}
