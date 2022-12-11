import 'package:flutter_gherkin/flutter_gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';
import 'package:mc_crud/mc_crud.dart';

StepDefinitionGeneric thenGetAllCustomers() {
  return then1<String, FlutterWorld>(
    'user can get all records and get {string} records',
    (count, context) async {
      final c = int.tryParse(count);
      final rep = CustomerLocalRespositoryImpl();
      final cList = await GetAllCustomerUseCaseImpl(rep).getCustomersList();
      context.expect(cList.result!.length, c);
    },
  );
}
