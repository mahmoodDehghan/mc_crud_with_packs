import 'package:customer_manager/customer_manager.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric thenCustomersListLoaded() {
  return then1<GherkinTable, FlutterWorld>('customers list loaded with:',
      (dataTable, context) async {
    final cList = await GetAllCustomerUseCaseImpl(
      CustomerLocalRespositoryImpl(),
    ).getCustomersList();
    final customers = cList.result!;
    // if (dataTable.rows.last.isHeaderRow) {
    //   context.expect(customers.isEmpty, true);
    // } else {
    final rowCustomers = dataTable.rows.map(
      (e) {
        final columns = e.columns;
        return Customer(
          id: e.rowIndex,
          email: columns.elementAt(3)!,
          bankAccountNumber: columns.elementAt(5)!,
          person: Person(
            id: e.rowIndex,
            firstName: columns.elementAt(0)!,
            lastName: columns.elementAt(1)!,
            birthDate: columns.elementAt(2)!,
          ),
          phone: columns.elementAt(4)!,
        );
      },
    ).toList();
    context.expect(customers, rowCustomers);
  }
      // }
      );
}
