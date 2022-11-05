import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric findFields() {
  return given2<String, String, FlutterWorld>(
    'I expect the {string} field and {string} field to be present',
    (key1, key2, context) async {
      final driver = context.world.appDriver;
      context.expect(
        await driver.isPresent(driver.findBy(key1, FindType.key)) &&
            await driver.isPresent(driver.findBy(key2, FindType.key)),
        true,
      );
    },
  );
}
