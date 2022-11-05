import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:intl/intl.dart';

StepDefinitionGeneric rightDateChanged() {
  return then1<String, FlutterWorld>(
    'I expect the {string} to be right date',
    (key, context) async {
      final driver = context.world.appDriver;
      final finder = driver.findBy(key, FindType.key);
      final txt = await driver.getText(finder);
      final lastYear =
          DateTime.now().subtract(const Duration(days: (19 * 365)));
      context.expect(
        txt,
        DateFormat.yMMMMd().format(lastYear),
      );
    },
  );
}
