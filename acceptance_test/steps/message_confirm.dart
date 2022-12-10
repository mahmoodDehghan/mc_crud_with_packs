import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric messageConfirm() {
  return then1<String, FlutterWorld>(
    'I expect the message {string} to be shown',
    (message, context) async {
      final driver = context.world.appDriver;
      expect(
        await driver.isPresent(
          driver.findBy(message, FindType.text),
        ),
        true,
      );
    },
  );
}
