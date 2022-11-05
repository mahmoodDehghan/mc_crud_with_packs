import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric ageRestriction() {
  return then<FlutterWorld>(
    "I can't select the age before eighteen",
    (context) async {
      final driver = context.world.appDriver;
      final d = DateTime.now().subtract(
        const Duration(
          days: 17 * 365,
        ),
      );
      final finder = driver.findBy(d.year.toString(), FindType.text);
      context.expect(await driver.isAbsent(finder), true);
    },
  );
}
