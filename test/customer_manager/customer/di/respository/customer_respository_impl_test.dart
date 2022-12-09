import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/hive_test.dart';
import 'package:mc_crud/mc_crud.dart';

void main() {
  group('custormer repository implementation tests', () {
    CustomerDTO? customer;
    setUp(() async {
      await setUpTestHive();
      customer = customer ??
          CustomerDTO(
            id: 1,
            person: PersonDTO(
              id: 1,
              dateOfBirth: 'May 01, 1999',
              firstName: 'alice',
              lastName: 'wonderland',
            ),
            email: 'email@email.com',
            phoneNumber: '+98123456783',
            bankAccountNumber: '213345456',
          );
    });
    tearDown(() async {
      await tearDownTestHive();
    });
    test('create customer test successfully', () async {
      expect(
          await CustomerLocalRespositoryImpl()
              .createCustomer(customer!.toJson()),
          GeneralResult<Customer>(
            result: CustomerMapper().map(customer!),
            errorMessage: '',
          ));
    });
    test('find a customer test successfully', () async {
      await CustomerLocalRespositoryImpl().createCustomer(customer!.toJson());
      final res = await CustomerLocalRespositoryImpl().getCustomer(1);
      expect(
          res,
          GeneralResult<Customer>(
            result: CustomerMapper().map(customer!),
            errorMessage: '',
          ));
    });
    test('find all customer list test successfully', () async {
      await CustomerLocalRespositoryImpl().createCustomer(customer!.toJson());
      final res = await CustomerLocalRespositoryImpl().getAllCustomers();
      expect(
          res,
          GeneralResult<List<Customer>>(
            result: [CustomerMapper().map(customer!)],
            errorMessage: '',
          ));
    });
    test('find all customer list test successfully', () async {
      await CustomerLocalRespositoryImpl().createCustomer(customer!.toJson());
      final res = await CustomerLocalRespositoryImpl().getAllCustomers();
      expect(
          res,
          GeneralResult<List<Customer>>(
            result: [CustomerMapper().map(customer!)],
            errorMessage: '',
          ));
    });
    test('remove customer test successfully', () async {
      await CustomerLocalRespositoryImpl().createCustomer(customer!.toJson());
      final res = await CustomerLocalRespositoryImpl().deleteCustomer(1);
      final res2 = await CustomerLocalRespositoryImpl().getAllCustomers();
      expect(
        res,
        const GeneralResult(
          result: true,
          errorMessage: '',
        ),
      );
      expect(
          res2,
          const GeneralResult<List<Customer>>(
            result: [],
            errorMessage: '',
          ));
    });
    test('update a customer test successfully', () async {
      await CustomerLocalRespositoryImpl().createCustomer(customer!.toJson());
      final customer2 = CustomerDTO(
        id: customer!.id,
        person: customer!.person,
        email: 'testu@te.com',
        phoneNumber: customer!.phoneNumber,
        bankAccountNumber: customer!.bankAccountNumber,
      );
      final res = await CustomerLocalRespositoryImpl()
          .updateCustomer(1, customer2.toJson());
      final res2 = await CustomerLocalRespositoryImpl().getAllCustomers();
      expect(
        res,
        const GeneralResult(
          result: true,
          errorMessage: '',
        ),
      );
      expect(
        res2,
        GeneralResult<List<Customer>>(
          result: [CustomerMapper().map(customer2)],
          errorMessage: '',
        ),
      );
    });
  });
}
