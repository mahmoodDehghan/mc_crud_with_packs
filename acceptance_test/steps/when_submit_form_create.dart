import 'package:flutter_gherkin/flutter_gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';
import 'package:mc_crud/mc_crud.dart';

StepDefinitionGeneric whenSubmitFormCreate() {
  return when1<GherkinTable, FlutterWorld>(
    RegExp(
        r'user fills and submit the form with:|create a customer with these details:'),
    (GherkinTable dataTable, context) async {
      final columns = dataTable.asMap();
      final firstName = columns.elementAt(0)['firstName'];
      final lastName = columns.elementAt(0)['lastName'];
      final dateOfBirth = columns.elementAt(0)['birthDate'];
      final email = columns.elementAt(0)['email'];
      final mobile = columns.elementAt(0)['phoneNumber'];
      final bankAccount = columns.elementAt(0)['bankAccountNumber'];
      await CreateCustomerUsecaseImpl(CustomerLocalRespositoryImpl())
          .createCustomer({
        JSONKeys.idKey: 1,
        JSONKeys.personKey: PersonDTO(
          id: 1,
          firstName: firstName!,
          lastName: lastName!,
          dateOfBirth: dateOfBirth!,
        ).toJson(),
        JSONKeys.emailKey: email!,
        JSONKeys.phoneKey: mobile!,
        JSONKeys.bankAccountKey: bankAccount!,
      });
    },
  );
}
