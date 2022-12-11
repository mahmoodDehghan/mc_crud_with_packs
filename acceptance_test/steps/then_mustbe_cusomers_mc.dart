import 'package:flutter_gherkin/flutter_gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';
import 'package:mc_crud/mc_crud.dart';

StepDefinitionGeneric thenMustbeCustomersMc() {
  return then2<String, GherkinTable, FlutterWorld>(
    'user can get list of all customers and there must be {string} record with below details',
    (number, dataTable, context) async {
      int count = int.tryParse(number) ?? 0;
      final columns = dataTable.asMap();

      final firstName = columns.elementAt(0)['FirstName'];
      final lastName = columns.elementAt(0)['LastName'];
      final dateOfBirth = BirthDate.fromStringymmmd(
              BirthDate.dateParser(columns.elementAt(0)['DateOfBirth'] ?? ''))
          .birthDateString;
      final email = columns.elementAt(0)['Email'];
      final mobile = columns.elementAt(0)['PhoneNumber'];
      final bankAccount = columns.elementAt(0)['BankAccountNumber'];
      final customer = Customer(
        id: 1,
        email: email!,
        bankAccountNumber: bankAccount!,
        person: Person(
          id: 1,
          firstName: firstName!,
          lastName: lastName!,
          birthDate: dateOfBirth,
        ),
        phone: mobile!,
      );
      final rep = CustomerLocalRespositoryImpl();
      final cList = await GetAllCustomerUseCaseImpl(rep).getCustomersList();
      final specCustomers =
          cList.result!.where((element) => element == customer).toList();
      context.expect(specCustomers.length, count);
    },
  );
}
