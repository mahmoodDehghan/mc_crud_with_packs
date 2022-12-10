import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';
import 'package:mc_crud/mc_crud.dart';

StepDefinitionGeneric showBirthDate() {
  return then<FlutterWorld>(
    'I expect the birthdate is shown',
    (context) async {
      final driver = context.world.appDriver;
      final finder = driver.findBy(
        BirthDate(
                birthDate:
                    DateTime.now().subtract(const Duration(days: (19 * 365))))
            .birthDateString,
        FindType.text,
      );
      expect(
        await driver.isPresent(finder),
        true,
      );
    },
  );
}
