import 'package:flutter_gherkin/flutter_gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

final systemErrors = <String, String>{};

StepDefinitionGeneric givenBackgroundErrorStep() {
  return given1<GherkinTable, FlutterWorld>(
    'system error codes are following',
    (dataTable, context) async {
      final columns = dataTable.asMap();

      for (var i = 0; i < dataTable.rows.length; i++) {
        systemErrors[columns.elementAt(i)['Code'] ?? 'nd'] =
            columns.elementAt(i)['Description'] ?? 'no desc';
      }
    },
  );
}
