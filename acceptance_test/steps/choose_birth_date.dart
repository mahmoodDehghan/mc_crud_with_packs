import 'package:flutter_gherkin/flutter_gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric pickRightDate() {
  return when<FlutterWorld>(
    'I choose birthdate from picker',
    (context) async {
      final driver = context.world.appDriver;
      final lastYear =
          DateTime.now().subtract(const Duration(days: (19 * 365)));
      await driver.scrollIntoView(
        driver.findBy(lastYear.year.toString(), FindType.text),
      );
      await driver.scrollIntoView(
        driver.findBy(lastYear.day.toString(), FindType.text),
      );
      final doneFinder = driver.findBy('Done', FindType.text);
      await driver.tap(doneFinder);
    },
  );
}
