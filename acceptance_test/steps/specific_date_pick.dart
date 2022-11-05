import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric pickSpecificDate() {
  return when<FlutterWorld>(
    'I choose 364 days before min date from picker',
    (context) async {
      final driver = context.world.appDriver;
      final lastYear =
          DateTime.now().subtract(const Duration(days: (19 * 365)));
      await driver.scrollIntoView(
        driver.findBy(lastYear.year.toString(), FindType.text),
      );
      final doneFinder = driver.findBy('Done', FindType.text);
      await driver.tap(doneFinder);
    },
  );
}
