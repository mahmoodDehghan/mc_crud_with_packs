import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric pickRightDate() {
  return when<FlutterWorld>(
    'I choose a before last year',
    (context) async {
      final driver = context.world.appDriver;
      final lastYear =
          DateTime.now().subtract(const Duration(days: (19 * 365)));
      // print(DateFormat.yMMMMd().format(lastYear));
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
