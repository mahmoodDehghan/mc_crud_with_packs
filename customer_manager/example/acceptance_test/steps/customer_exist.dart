import 'package:customer_manager/customer_manager.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric customerExist() {
  return when<FlutterWorld>(
    'there is customer in db',
    (context) async {
      final rep = CustomerLocalRespositoryImpl();
      final cList = await GetAllCustomerUseCaseImpl(rep).getCustomersList();
      expect(cList.result!.isNotEmpty, true);
    },
  );
}
