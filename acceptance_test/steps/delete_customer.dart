import 'package:customer_manager/customer_manager.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric whenDeleteCustomer() {
  return when1<GherkinTable, FlutterWorld>(
    'user delete a customer with these details:',
    (dataTable, context) async {
      final columns = dataTable.asMap();
      final firstName = columns.elementAt(0)['firstName'];
      final lastName = columns.elementAt(0)['lastName'];
      final dateOfBirth = columns.elementAt(0)['birthDate'];
      final email = columns.elementAt(0)['email'];
      final mobile = columns.elementAt(0)['phoneNumber'];
      final bankAccount = columns.elementAt(0)['bankAccountNumber'];
      final customer = Customer(
        id: 1,
        email: email!,
        bankAccountNumber: bankAccount!,
        person: Person(
          id: 1,
          firstName: firstName!,
          lastName: lastName!,
          birthDate: dateOfBirth!,
        ),
        phone: mobile!,
      );
      final rep = CustomerLocalRespositoryImpl();
      final cList = await GetAllCustomerUseCaseImpl(rep).getCustomersList();
      final customers = cList.result!;
      final c = customers.firstWhere((element) => element == customer);
      await DeleteCustomerUsecaseImpl(rep).deleteCustomer(c.id);
    },
  );
}
