import 'package:flutter_gherkin/flutter_gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric tapWidget() {
  return when1<String, FlutterWorld>(
    'I tap the {string}',
    (key, context) async {
      final driver = context.world.appDriver;
      final finder = driver.findBy(key, FindType.key);
      await driver.scrollIntoView(finder);
      await driver.tap(finder);
    },
  );
}
