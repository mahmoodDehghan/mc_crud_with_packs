import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric findButton() {
  return given1<String, FlutterWorld>(
    'I expect the {string} to be present',
    (key, context) async {
      final driver = context.world.appDriver;
      final finder = driver.findBy(key, FindType.key);
      // await driver.scroll(finder);
      context.expect(await driver.isPresent(finder), true);
    },
  );
}
