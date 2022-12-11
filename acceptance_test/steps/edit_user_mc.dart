import 'package:flutter_gherkin/flutter_gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';
import 'package:mc_crud/mc_crud.dart';

String isBlank(String entry) {
  return entry == '[blank]' ? '' : entry;
}

StepDefinitionGeneric whenEditUser() {
  return when1<GherkinTable, FlutterWorld>(
    'user edit customer with new data',
    (dataTable, context) async {
      final columns = dataTable.asMap();
      final firstName = columns.elementAt(0)['FirstName'] ?? "";
      final lastName = columns.elementAt(0)['LastName'] ?? "";
      final dateOfBirth = BirthDate.fromStringymmmd(
          BirthDate.dateParser(columns.elementAt(0)['DateOfBirth'] ?? ""));
      final email = columns.elementAt(0)['Email'] ?? "";
      final mobile = columns.elementAt(0)['PhoneNumber'] ?? "";
      final bankAccount = columns.elementAt(0)['BankAccountNumber'] ?? "";
      // final res =
      await UpdateCustomerUsecaseImpl(CustomerLocalRespositoryImpl())
          .updateCustomer(1, {
        JSONKeys.idKey: 1,
        JSONKeys.personKey: PersonDTO(
          id: 1,
          firstName: isBlank(firstName),
          lastName: isBlank(lastName),
          birthYear: dateOfBirth.birthDate.year,
          birthMonth: dateOfBirth.birthDate.month,
          birthDay: dateOfBirth.birthDate.day,
        ).toJson(),
        JSONKeys.emailKey: isBlank(email),
        JSONKeys.phoneKey: isBlank(mobile),
        JSONKeys.bankAccountKey: isBlank(bankAccount),
      });
      // print('error:${res.errorMessage!}');
    },
  );
}
