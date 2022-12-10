import 'package:flutter_gherkin/flutter_gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';
import 'package:mc_crud/mc_crud.dart';

String isBlank(String entry) {
  return entry == '[blank]' ? '' : entry;
}

StepDefinitionGeneric whenUpdateFirstCustomer() {
  return when1<GherkinTable, FlutterWorld>(
    'user updates a first customer to these details:',
    (dataTable, context) async {
      final columns = dataTable.asMap();
      final firstName = columns.elementAt(0)['firstName'] ?? "";
      final lastName = columns.elementAt(0)['lastName'] ?? "";
      final dateOfBirth = columns.elementAt(0)['birthDate'] ?? "";
      final email = columns.elementAt(0)['email'] ?? "";
      final mobile = columns.elementAt(0)['phoneNumber'] ?? "";
      final bankAccount = columns.elementAt(0)['bankAccountNumber'] ?? "";
      final date = BirthDate.fromString(isBlank(dateOfBirth));
      await UpdateCustomerUsecaseImpl(CustomerLocalRespositoryImpl())
          .updateCustomer(1, {
        JSONKeys.idKey: 1,
        JSONKeys.personKey: PersonDTO(
          id: 1,
          firstName: isBlank(firstName),
          lastName: isBlank(lastName),
          birthYear: date.birthDate.year,
          birthMonth: date.birthDate.month,
          birthDay: date.birthDate.day,
        ).toJson(),
        // PersonMapper()
        //     .reverse(Person(
        //         id: 1,
        //         firstName: isBlank(firstName),
        //         lastName: isBlank(lastName),
        //         birthDate: isBlank(dateOfBirth)))
        //     .toJson(),
        JSONKeys.emailKey: isBlank(email),
        JSONKeys.phoneKey: isBlank(mobile),
        JSONKeys.bankAccountKey: isBlank(bankAccount),
      });
    },
  );
}
