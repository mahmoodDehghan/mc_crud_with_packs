import 'package:flutter_gherkin/flutter_gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';
import 'package:mc_crud/mc_crud.dart';

StepDefinitionGeneric whenDeleteUser() {
  return when1<String, FlutterWorld>(
    'user delete customer by Email of {string}',
    (email, context) async {
      final rep = CustomerLocalRespositoryImpl();
      final cList = await GetAllCustomerUseCaseImpl(rep).getCustomersList();
      final customers = cList.result!;
      final c = customers.firstWhere((element) => element.email == email);
      await DeleteCustomerUsecaseImpl(rep).deleteCustomer(c.id);
    },
  );
}
