import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_test/hive_test.dart';
import 'package:mc_crud/mc_crud.dart';

void main() {
  setUp(() async {
    configureDependencies();
    await setUpTestHive();
  });
  tearDown(() async {
    await tearDownTestHive();
  });
  group('customer show bloc tests', () {
    blocTest(
      'load all customers empty',
      build: () => CustomerShowBloc(),
      act: (bloc) => bloc.add(
        LoadCustomersList(),
      ),
      wait: const Duration(seconds: 1),
      expect: () => [
        const CustomerShowState(
          allCustomers: <Customer>[],
          showMessage: 'There is no customer!',
          status: CustomerShowStatus.fail,
        ),
      ],
    );
    blocTest(
      'set need to refresh list',
      build: () => CustomerShowBloc(),
      act: (bloc) => bloc.add(
        SetNeedToRefresh(),
      ),
      expect: () => [
        const CustomerShowState(
          needToRefresh: true,
        ),
      ],
    );
    blocTest(
      'set in progress',
      build: () => CustomerShowBloc(),
      act: (bloc) => bloc.add(
        SetInProgress(),
      ),
      expect: () => [
        const CustomerShowState(status: CustomerShowStatus.pending),
      ],
    );
    blocTest(
      'look for a customer with right id',
      setUp: () async {
        await CreateCustomerUsecaseImpl(CustomerLocalRespositoryImpl())
            .createCustomer(
          CustomerDTO(
            id: 1,
            person: PersonDTO(
              id: 1,
              firstName: 'tim',
              lastName: 'burton',
              dateOfBirth: 'May 16,1869',
            ),
            email: "tim@mim.com",
            bankAccountNumber: '124355646',
            phoneNumber: '9891234343545',
          ).toJson(),
        );
      },
      build: () => CustomerShowBloc(),
      act: (bloc) => bloc
        ..add(
          SetInProgress(),
        )
        ..add((const LookForCustomer("1"))),
      skip: 1,
      wait: const Duration(seconds: 1),
      expect: () => [
        CustomerShowState(
          status: CustomerShowStatus.success,
          showMessage: '',
          currentCustomer: CustomerMapper().map(
            CustomerDTO(
              id: 1,
              person: PersonDTO(
                id: 1,
                firstName: 'tim',
                lastName: 'burton',
                dateOfBirth: 'May 16,1869',
              ),
              email: "tim@mim.com",
              bankAccountNumber: '124355646',
              phoneNumber: '9891234343545',
            ),
          ),
        ),
      ],
    );
    blocTest(
      'load all customers with data',
      setUp: () async {
        await CreateCustomerUsecaseImpl(CustomerLocalRespositoryImpl())
            .createCustomer(
          CustomerDTO(
            id: 1,
            person: PersonDTO(
              id: 1,
              firstName: 'tim',
              lastName: 'burton',
              dateOfBirth: 'May 16,1869',
            ),
            email: "tim@mim.com",
            bankAccountNumber: '124355646',
            phoneNumber: '9891234343545',
          ).toJson(),
        );
      },
      build: () => CustomerShowBloc(),
      act: (bloc) => bloc
        ..add(
          SetInProgress(),
        )
        ..add((LoadCustomersList())),
      skip: 1,
      wait: const Duration(seconds: 1),
      expect: () => [
        CustomerShowState(
          status: CustomerShowStatus.success,
          showMessage: '',
          allCustomers: [
            CustomerMapper().map(
              CustomerDTO(
                id: 1,
                person: PersonDTO(
                  id: 1,
                  firstName: 'tim',
                  lastName: 'burton',
                  dateOfBirth: 'May 16,1869',
                ),
                email: "tim@mim.com",
                bankAccountNumber: '124355646',
                phoneNumber: '9891234343545',
              ),
            )
          ],
        ),
      ],
    );

    blocTest(
      'change all customers list',
      build: () => CustomerShowBloc(),
      act: (bloc) => bloc.add(const CustomersListChanged(
        customersList: GeneralResult<List<Customer>>(
          result: <Customer>[
            Customer(
              id: 1,
              email: "email@email.com",
              bankAccountNumber: '142445',
              person: Person(
                id: 1,
                firstName: 'matt',
                lastName: 'perry',
                birthDate: 'June 14, 1880',
              ),
              phone: '+124567879',
            )
          ],
          errorMessage: '',
        ),
        message: '',
      )),
      expect: () => [
        const CustomerShowState(
          allCustomers: <Customer>[
            Customer(
              id: 1,
              email: "email@email.com",
              bankAccountNumber: '142445',
              person: Person(
                id: 1,
                firstName: 'matt',
                lastName: 'perry',
                birthDate: 'June 14, 1880',
              ),
              phone: '+124567879',
            ),
          ],
          showMessage: '',
        ),
      ],
    );
    blocTest(
      'change current customer',
      build: () => CustomerShowBloc(),
      seed: () => const CustomerShowState(
        currentCustomer: Customer(
          id: 1,
          email: "email@email.com",
          bankAccountNumber: '142445',
          person: Person(
            id: 1,
            firstName: 'matt',
            lastName: 'perry',
            birthDate: 'June 14, 1880',
          ),
          phone: '+124567879',
        ),
        allCustomers: <Customer>[
          Customer(
            id: 1,
            email: "email@email.com",
            bankAccountNumber: '142445',
            person: Person(
              id: 1,
              firstName: 'matt',
              lastName: 'perry',
              birthDate: 'June 14, 1880',
            ),
            phone: '+124567879',
          ),
          Customer(
            id: 2,
            email: "mike@email.com",
            bankAccountNumber: '142445',
            person: Person(
              id: 1,
              firstName: 'mike',
              lastName: 'perry',
              birthDate: 'June 14, 1880',
            ),
            phone: '+124567879123',
          )
        ],
      ),
      act: (bloc) => bloc.add(const CurrentCustomerChanged(
        currentCustomer: GeneralResult<Customer>(
          result: Customer(
            id: 2,
            email: "mike@email.com",
            bankAccountNumber: '142445',
            person: Person(
              id: 1,
              firstName: 'mike',
              lastName: 'perry',
              birthDate: 'June 14, 1880',
            ),
            phone: '+124567879123',
          ),
          errorMessage: '',
        ),
      )),
      expect: () => [
        const CustomerShowState(
          allCustomers: <Customer>[
            Customer(
              id: 1,
              email: "email@email.com",
              bankAccountNumber: '142445',
              person: Person(
                id: 1,
                firstName: 'matt',
                lastName: 'perry',
                birthDate: 'June 14, 1880',
              ),
              phone: '+124567879',
            ),
            Customer(
              id: 2,
              email: "mike@email.com",
              bankAccountNumber: '142445',
              person: Person(
                id: 1,
                firstName: 'mike',
                lastName: 'perry',
                birthDate: 'June 14, 1880',
              ),
              phone: '+124567879123',
            )
          ],
          currentCustomer: Customer(
            id: 2,
            email: "mike@email.com",
            bankAccountNumber: '142445',
            person: Person(
              id: 1,
              firstName: 'mike',
              lastName: 'perry',
              birthDate: 'June 14, 1880',
            ),
            phone: '+124567879123',
          ),
          showMessage: '',
        ),
      ],
    );
  });
}
