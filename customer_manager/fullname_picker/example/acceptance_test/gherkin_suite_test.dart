import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

// The application under test.
import 'package:example/main.dart' as app;

import 'steps/right_scene_given.dart';
import 'steps/right_scene_when.dart';

part 'gherkin_suite_test.g.dart';

@GherkinTestSuite(
  featurePaths: ['acceptance_test/features/**.feature'],
)
void main() {
  executeTestSuite(
    configuration: FlutterTestConfiguration(
      stepDefinitions: [findFields(), fillFields()],
      waitImplicitlyAfterAction: true,
      reporters: [
        StdoutReporter(MessageLevel.error)
          ..setWriteLineFn(print)
          ..setWriteFn(print),
        ProgressReporter()
          ..setWriteLineFn(print)
          ..setWriteFn(print),
        TestRunSummaryReporter()
          ..setWriteLineFn(print)
          ..setWriteFn(print),
        JsonReporter(
          writeReport: (_, __) => Future<void>.value(),
        ),
      ],
    ),
    appMainFunction: (World world) async => app.main(),
  );
}
