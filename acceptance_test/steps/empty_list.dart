import 'package:customer_manager/customer_manager.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric thenNoCustomerExist() {
  return then<FlutterWorld>(
    'there is no customer in list',
    (context) async {
      final cList = await GetAllCustomerUseCaseImpl(
        CustomerLocalRespositoryImpl(),
      ).getCustomersList();
      final customers = cList.result!;
      context.expect(customers.isEmpty, true);
    },
  );
}
