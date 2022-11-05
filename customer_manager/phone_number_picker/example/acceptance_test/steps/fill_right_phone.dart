import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric fillRightPhoneNumber() {
  return when1<String, FlutterWorld>(
    'I fill the {string} field with right number',
    (key, context) async {
      final driver = context.world.appDriver;
      // final countrySelector =
      //     await driver.findBy(CountryCodeChip, FindType.type);
      // await driver.tap(countrySelector);
      // final iranFinder = await driver.findBy("98", FindType.text);
      // await driver.scrollIntoView(iranFinder);
      // await driver.tap(iranFinder);
      final finder = await driver.findBy(key, FindType.key);
      await driver.enterText(finder, "+989127606447");
    },
  );
}
