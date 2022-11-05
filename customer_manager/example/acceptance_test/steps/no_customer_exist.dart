import 'package:customer_manager/customer_manager.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

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
