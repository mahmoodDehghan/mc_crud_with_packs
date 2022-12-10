import 'package:flutter_gherkin/flutter_gherkin.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric scrollTop() {
  return when<FlutterWorld>(
    'I scroll to top',
    (context) async {
      final driver = context.world.appDriver;
      driver.scrollIntoView(
        await driver.findBy(
          "error_message",
          FindType.key,
        ),
      );
    },
  );
}
