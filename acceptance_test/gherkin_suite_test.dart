import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

// The application under test.
import 'package:flutter_app_template/main.dart' as app;

import 'steps/counter_when_step.dart';

part 'gherkin_suite_test.g.dart';

@GherkinTestSuite(
  featurePaths: ['acceptance_test/features/**.feature'],
)
void main() {
  executeTestSuite(
    configuration: FlutterTestConfiguration(
      stepDefinitions: [tapButtonNTimesStep()],
      waitImplicitlyAfterAction: true,
      semanticsEnabled: false,
      defaultTimeout: const Duration(seconds: 40),
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
