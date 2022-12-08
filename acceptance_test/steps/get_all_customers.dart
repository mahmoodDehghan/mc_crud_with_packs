import 'package:customer_manager/customer_manager.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric whenGetAllCustomers() {
  return when<FlutterWorld>(
    'user request get all customers',
    (context) async {
      final customersList =
          await GetAllCustomerUseCaseImpl(CustomerLocalRespositoryImpl())
              .getCustomersList();
      context.expect(customersList.result, isNotNull);
    },
  );
}
