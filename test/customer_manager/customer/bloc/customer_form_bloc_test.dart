import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_test/hive_test.dart';
import 'package:mc_crud/mc_crud.dart';

void main() {
  group('customer form bloc tests', () {
    CustomerDTO? customer, customer2;
    setUp(() async {
      if (!GetIt.I.isRegistered<CustomerRepository>(
          instanceName: DefaultConsts.localRep)) {
        configureDependencies();
      }
      await setUpTestHive();
      customer = customer ??
          CustomerDTO(
            id: 1,
            email: "email@email.com",
            bankAccountNumber: 'ir110570033780012625008101',
            person: PersonDTO(
              id: 1,
              firstName: 'matt',
              lastName: 'perry',
              birthYear: 1880,
              birthMonth: 6,
              birthDay: 14,
            ),
            phoneNumber: 989124567879,
          );
      customer2 = customer2 ??
          CustomerDTO(
            id: 1,
            email: "email@email.com",
            bankAccountNumber: 'ir110570033780012625008101',
            person: PersonDTO(
              id: 1,
              firstName: 'tom',
              lastName: 'perry',
              birthYear: 1880,
              birthMonth: 6,
              birthDay: 14,
            ),
            phoneNumber: 989124567879,
          );
    });
    tearDown(() async {
      customer = null;
      await tearDownTestHive();
    });
    blocTest(
      'save a customer successfully',
      build: () => CustomerFormBloc(),
      act: (bloc) => bloc
        ..add(SetFormInProgress())
        ..add(
          CustomerCreateSubmitted(
            entry: customer!.toJson(),
            entryStatus: true,
          ),
        ),
      skip: 1,
      wait: const Duration(seconds: 1),
      expect: () => [
        CustomerFormState(
          customer: CustomerMapper().map(customer!),
          status: CustomerFormStatus.success,
          formMessage: 'Customer saved!',
          isUpdate: true,
        ),
      ],
    );
    blocTest(
      'failed to save a customer',
      build: () => CustomerFormBloc(),
      act: (bloc) => bloc
        ..add(SetFormInProgress())
        ..add(
          CustomerCreateSubmitted(
            entry: customer!.toJson(),
            entryStatus: false,
            errMessage: 'save failed!',
          ),
        ),
      skip: 1,
      wait: const Duration(seconds: 1),
      expect: () => [
        const CustomerFormState(
          formMessage: 'save failed!',
          status: CustomerFormStatus.failed,
        ),
      ],
    );
    blocTest(
      'update a customer successfully',
      build: () => CustomerFormBloc(),
      setUp: () async {
        await CreateCustomerUsecaseImpl(CustomerLocalRespositoryImpl())
            .createCustomer(customer!.toJson());
      },
      act: (bloc) => bloc
        ..add(SetFormInProgress())
        ..add(
          CustomerUpdateSubmitted(
            entry: customer2!.toJson(),
            id: '1',
            entryStatus: true,
          ),
        ),
      skip: 1,
      wait: const Duration(seconds: 2),
      expect: () => [
        const CustomerFormState(
          // customer: CustomerMapper().map(customer2!),
          status: CustomerFormStatus.success,
          formMessage: 'Customer updated!',
        ),
      ],
    );
    blocTest(
      'failed to update a customer',
      setUp: () async {
        await CreateCustomerUsecaseImpl(CustomerLocalRespositoryImpl())
            .createCustomer(customer!.toJson());
      },
      build: () => CustomerFormBloc(),
      act: (bloc) => bloc
        ..add(SetFormInProgress())
        ..add(
          CustomerUpdateSubmitted(
            entry: customer2!.toJson(),
            id: '1',
            entryStatus: false,
            errMessage: 'update failed!',
          ),
        ),
      skip: 1,
      wait: const Duration(seconds: 2),
      expect: () => [
        const CustomerFormState(
          // customer: CustomerMapper().map(customer!),
          status: CustomerFormStatus.failed,
          formMessage: 'update failed!',
        ),
      ],
    );
    blocTest(
      'delete a customer successfully',
      build: () => CustomerFormBloc(),
      setUp: () async {
        await CreateCustomerUsecaseImpl(CustomerLocalRespositoryImpl())
            .createCustomer(customer!.toJson());
      },
      act: (bloc) => bloc
        ..add(SetFormInProgress())
        ..add(
          const CustomerDeleteConfirmed(
            id: '1',
          ),
        ),
      skip: 1,
      wait: const Duration(seconds: 2),
      expect: () => [
        const CustomerFormState(
          status: CustomerFormStatus.success,
          formMessage: 'Customer removed!',
        ),
      ],
    );
    blocTest(
      'failed to remove a customer',
      build: () => CustomerFormBloc(),
      setUp: () async {
        await CreateCustomerUsecaseImpl(CustomerLocalRespositoryImpl())
            .createCustomer(customer!.toJson());
      },
      act: (bloc) => bloc
        ..add(SetFormInProgress())
        ..add(
          const CustomerDeleteConfirmed(
            id: '2',
          ),
        ),
      skip: 1,
      wait: const Duration(seconds: 2),
      expect: () => [
        const CustomerFormState(
          status: CustomerFormStatus.failed,
          formMessage: 'Customer not found!',
        ),
      ],
    );
    blocTest(
      'set a customer',
      build: () => CustomerFormBloc(),
      setUp: () async {
        await CreateCustomerUsecaseImpl(CustomerLocalRespositoryImpl())
            .createCustomer(customer!.toJson());
      },
      act: (bloc) => bloc
        ..add(
          const SetCustomer(
            id: '1',
          ),
        ),
      wait: const Duration(seconds: 2),
      expect: () => [
        CustomerFormState(
          customer: CustomerMapper().map(customer!),
          status: CustomerFormStatus.fieldInit,
          isUpdate: true,
        ),
      ],
    );
    blocTest(
      'set init state',
      build: () => CustomerFormBloc(),
      act: (bloc) => bloc
        ..add(
          SetInitState(),
        ),
      expect: () => [
        const CustomerFormState(
          status: CustomerFormStatus.init,
        ),
      ],
    );
  });
}
