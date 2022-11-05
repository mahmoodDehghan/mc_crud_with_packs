import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:birth_date_picker/birth_date_picker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

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
