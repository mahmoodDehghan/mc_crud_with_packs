import 'package:flutter_gherkin/flutter_gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';
import 'package:mc_crud/mc_crud.dart';

String isBlank(String entry) {
  return entry == '[blank]' ? '' : entry;
}

StepDefinitionGeneric whenCreate() {
  return when1<GherkinTable, FlutterWorld>(
    'user creates a customer with following data by clicking submit and typing below data',
    (dataTable, context) async {
      final columns = dataTable.asMap();
      final firstName = columns.elementAt(0)['FirstName'] ?? '';
      final lastName = columns.elementAt(0)['LastName'] ?? '';
      final dateOfBirth = columns.elementAt(0)['DateOfBirth'] ?? '';
      final email = columns.elementAt(0)['Email'] ?? '';
      final mobile = columns.elementAt(0)['PhoneNumber'] ?? '';
      final bankAccount = columns.elementAt(0)['BankAccountNumber'] ?? '';
      final rep = CustomerLocalRespositoryImpl();
      final customers = await GetAllCustomerUseCaseImpl(rep).getCustomersList();
      final id = customers.result!.isEmpty ? 1 : customers.result!.length + 1;
      final date = BirthDate.fromStringymmmd(BirthDate.dateParser(dateOfBirth));
      await CreateCustomerUsecaseImpl(rep).createCustomer({
        JSONKeys.idKey: id,
        JSONKeys.personKey: PersonDTO(
          id: id,
          firstName: isBlank(firstName),
          lastName: isBlank(lastName),
          birthYear: date.birthDate.year,
          birthMonth: date.birthDate.month,
          birthDay: date.birthDate.day,
        ).toJson(),
        JSONKeys.emailKey: isBlank(email),
        JSONKeys.phoneKey: isBlank(mobile),
        JSONKeys.bankAccountKey: isBlank(bankAccount),
      });
    },
  );
}
