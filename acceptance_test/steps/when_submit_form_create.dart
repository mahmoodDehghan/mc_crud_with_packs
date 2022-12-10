import 'package:flutter_gherkin/flutter_gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';
import 'package:mc_crud/mc_crud.dart';

String isBlank(String entry) {
  return entry == '[blank]' ? '' : entry;
}

StepDefinitionGeneric whenSubmitFormCreate() {
  return when1<GherkinTable, FlutterWorld>(
    RegExp(
        r'user fills and submit the form with:|create a customer with these details:'),
    (GherkinTable dataTable, context) async {
      final columns = dataTable.asMap();
      final firstName = columns.elementAt(0)['firstName'] ?? '';
      final lastName = columns.elementAt(0)['lastName'] ?? '';
      final dateOfBirth = columns.elementAt(0)['birthDate'] ?? '';
      final email = columns.elementAt(0)['email'] ?? '';
      final mobile = columns.elementAt(0)['phoneNumber'] ?? '';
      final bankAccount = columns.elementAt(0)['bankAccountNumber'] ?? '';
      final rep = CustomerLocalRespositoryImpl();
      final customers = await GetAllCustomerUseCaseImpl(rep).getCustomersList();
      final id = customers.result!.isEmpty ? 1 : customers.result!.length + 1;
      await CreateCustomerUsecaseImpl(rep).createCustomer({
        JSONKeys.idKey: id,
        JSONKeys.personKey: PersonDTO(
          id: id,
          firstName: isBlank(firstName),
          lastName: isBlank(lastName),
          dateOfBirth: isBlank(dateOfBirth),
        ).toJson(),
        JSONKeys.emailKey: isBlank(email),
        JSONKeys.phoneKey: isBlank(mobile),
        JSONKeys.bankAccountKey: isBlank(bankAccount),
      });
    },
  );
}
