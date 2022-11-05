import 'package:customer_manager/customer_manager.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/hive_test.dart';

void main() {
  group('customer local data source tests', () {
    setUp(() async {
      await setUpTestHive();
    });
    tearDown(() async {
      await tearDownTestHive();
    });
    test('add customer', () async {
      final customer = createTempCustomer();
      final dataSource = CustomerLocalDataSource();
      final res = await dataSource.createCustomer(customer.toJson());
      expect(
        res,
        GeneralResult<CustomerDTO>(
          result: customer,
          errorMessage: '',
        ),
      );
    });
    test('add customer with existing email', () async {
      final customer = createTempCustomer();
      final customer2 = createTempCustomerSameEmail();
      final dataSource = CustomerLocalDataSource();
      await dataSource.createCustomer(customer.toJson());
      final res2 = await dataSource.createCustomer(customer2.toJson());
      expect(
        res2,
        const GeneralResult<CustomerDTO>(
          result: null,
          errorMessage: 'this email already registered!',
        ),
      );
    });
    test('add customer with existing person', () async {
      final customer = createTempCustomer();
      final customer2 = createTempCustomerSamePerson();
      final dataSource = CustomerLocalDataSource();
      await dataSource.createCustomer(customer.toJson());
      final res2 = await dataSource.createCustomer(customer2.toJson());
      expect(
        res2,
        const GeneralResult<CustomerDTO>(
          result: null,
          errorMessage: 'person with these details already registered!',
        ),
      );
    });

    test('update customer with existing email', () async {
      final customer = createTempCustomer();
      final customer2 = createTempCustomer2();
      final dataSource = CustomerLocalDataSource();
      await dataSource.createCustomer(customer.toJson());
      await dataSource.createCustomer(customer2.toJson());
      final updatedCustomer = CustomerDTO(
        id: customer2.id,
        person: customer2.person,
        email: customer.email,
        phoneNumber: customer2.phoneNumber,
        bankAccountNumber: customer2.bankAccountNumber,
      );
      final res = await dataSource.updateCustomer(
          customer2.id, updatedCustomer.toJson());
      expect(
        res,
        const GeneralResult<bool>(
          result: null,
          errorMessage: 'this email already registered!',
        ),
      );
    });

    test('update customer with existing person', () async {
      final customer = createTempCustomer();
      final customer2 = createTempCustomer2();
      final dataSource = CustomerLocalDataSource();
      await dataSource.createCustomer(customer.toJson());
      await dataSource.createCustomer(customer2.toJson());
      final updatedCustomer = CustomerDTO(
        id: customer2.id,
        person: customer.person,
        email: customer2.email,
        phoneNumber: customer2.phoneNumber,
        bankAccountNumber: customer2.bankAccountNumber,
      );
      final res = await dataSource.updateCustomer(
          customer2.id, updatedCustomer.toJson());
      expect(
        res,
        const GeneralResult<bool>(
          result: null,
          errorMessage: 'person with these details already registered!',
        ),
      );
    });
    test('show a customer', () async {
      createTempCustomerAndSaveIt();
      final dataSource = CustomerLocalDataSource();
      final res = await dataSource.getCustomer(1);
      expect(
        res,
        GeneralResult<CustomerDTO>(
          result: createTempCustomer(),
          errorMessage: '',
        ),
      );
    });
    test('customer not find', () async {
      final dataSource = CustomerLocalDataSource();
      final res = await dataSource.getCustomer(1);
      expect(
        res,
        const GeneralResult<CustomerDTO>(
          result: null,
          errorMessage: DefaultConsts.notFound,
        ),
      );
    });
    test('customer list empty', () async {
      final dataSource = CustomerLocalDataSource();
      final res = await dataSource.getAllCustomers();
      expect(
        res,
        const GeneralResult<List<CustomerDTO>>(
          result: <CustomerDTO>[],
          errorMessage: '',
        ),
      );
    });
    test('load customer list ', () async {
      createTempCustomerAndSaveIt();
      final dataSource = CustomerLocalDataSource();
      final res = await dataSource.getAllCustomers();
      expect(
        res,
        GeneralResult<List<CustomerDTO>>(
          result: <CustomerDTO>[
            createTempCustomer(),
          ],
          errorMessage: '',
        ),
      );
    });
    test('update a customer', () async {
      createTempCustomerAndSaveIt();
      final dataSource = CustomerLocalDataSource();
      final res = await dataSource.getCustomer(1);
      final customer = res.result;
      final updatedCustomer = CustomerDTO(
        id: customer!.id,
        person: customer.person,
        email: customer.email,
        phoneNumber: customer.phoneNumber,
        bankAccountNumber: '234565',
      );
      await dataSource.updateCustomer(
        updatedCustomer.id,
        updatedCustomer.toJson(),
      );
      final updatedDate = await dataSource.getCustomer(updatedCustomer.id);
      expect(
        updatedDate,
        GeneralResult<CustomerDTO>(
          result: updatedCustomer,
          errorMessage: '',
        ),
      );
    });
    test('remove a customer', () async {
      createTempCustomerAndSaveIt();
      final dataSource = CustomerLocalDataSource();
      final res = await dataSource.getCustomer(1);
      final customer = res.result;
      final delRes = await dataSource.deleteCustomer(customer!.id);
      expect(
        delRes,
        const GeneralResult<bool>(
          result: true,
          errorMessage: '',
        ),
      );
      final result = await dataSource.getCustomer(customer.id);
      expect(
        result,
        const GeneralResult<CustomerDTO>(
          result: null,
          errorMessage: DefaultConsts.notFound,
        ),
      );
    });
  });
}

CustomerDTO createTempCustomer2() {
  return CustomerDTO(
    id: 2,
    person: PersonDTO(
      id: 2,
      firstName: 'tom',
      lastName: 'hardy',
      dateOfBirth: 'July 16, 1991',
    ),
    email: 'tom@gmail.com',
    phoneNumber: '+98913434256',
    bankAccountNumber: '123356456788',
  );
}

CustomerDTO createTempCustomer() {
  return CustomerDTO(
    id: 1,
    person: PersonDTO(
      id: 1,
      firstName: 'mahmoud',
      lastName: 'dehghan',
      dateOfBirth: 'July 16, 1990',
    ),
    email: 'mdm1369@gmail.com',
    phoneNumber: '+989127606447',
    bankAccountNumber: '123456788',
  );
}

CustomerDTO createTempCustomerSamePerson() {
  return CustomerDTO(
    id: 2,
    person: PersonDTO(
      id: 2,
      firstName: 'mahmoud',
      lastName: 'dehghan',
      dateOfBirth: 'July 16, 1990',
    ),
    email: 'mdm13@gmail.com',
    phoneNumber: '+989127606447',
    bankAccountNumber: '123456788',
  );
}

CustomerDTO createTempCustomerSameEmail() {
  return CustomerDTO(
    id: 2,
    person: PersonDTO(
      id: 2,
      firstName: 'ali',
      lastName: 'dehghan',
      dateOfBirth: 'July 16, 1990',
    ),
    email: 'mdm1369@gmail.com',
    phoneNumber: '+989127606447',
    bankAccountNumber: '123456788',
  );
}

void createTempCustomerAndSaveIt() {
  final customer = createTempCustomer();
  final dataSource = CustomerLocalDataSource();
  dataSource.createCustomer(customer.toJson());
}
