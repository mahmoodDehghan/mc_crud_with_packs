import 'package:flutter_gherkin/flutter_gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric isPresent() {
  return given1<String, FlutterWorld>(
    'I expect the {string} to be present',
    (key, context) async {
      final driver = context.world.appDriver;
      final finder = driver.findBy(key, FindType.key);
      context.expect(await driver.isPresent(finder), true);
    },
  );
}
