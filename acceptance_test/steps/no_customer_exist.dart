import 'package:flutter_gherkin/flutter_gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';
import 'package:mc_crud/mc_crud.dart';

StepDefinitionGeneric noCustomerExist() {
  return when<FlutterWorld>(
    'there is no customer in db',
    (context) async {
      final rep = CustomerLocalRespositoryImpl();
      final cList = await GetAllCustomerUseCaseImpl(rep).getCustomersList();
      if ((cList.result ?? []).isNotEmpty) {
        for (final c in cList.result!) {
          await DeleteCustomerUsecaseImpl(rep).deleteCustomer(c.id);
        }
      }
    },
  );
}
