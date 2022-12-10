import 'package:flutter_gherkin/flutter_gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric givenBackgroundErrorStep() {
  return given1<GherkinTable, FlutterWorld>(
    'system error codes are following',
    (dataTable, context) async {
      final columns = dataTable.asMap();
      final errorMap = <String, String>{};
      for (var i = 0; i <= dataTable.rows.length; i++) {
        print(i);
        print(columns.elementAt(i)['Code'] ?? 'nd');
        print(columns.elementAt(i)['Description'] ?? 'no desc');
        errorMap[columns.elementAt(i)['Code'] ?? 'nd'] =
            columns.elementAt(i)['Description'] ?? 'no desc';
      }
    },
  );
}
