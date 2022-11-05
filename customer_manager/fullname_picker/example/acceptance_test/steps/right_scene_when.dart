import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric fillFields() {
  return when4<String, String, String, String, FlutterWorld>(
    'I fill the {string} field with {string} and I fill the {string} with {string}',
    (key1, value1, key2, value2, context) async {
      final driver = context.world.appDriver;
      final finder = context.world.appDriver.findBy(key1, FindType.key);
      final finder2 = context.world.appDriver.findBy(key2, FindType.key);
      await context.world.appDriver.scrollIntoView(finder);
      await driver.enterText(finder, value1);
      await context.world.appDriver.scrollIntoView(finder2);
      await driver.enterText(finder2, value2);
    },
  );
}
