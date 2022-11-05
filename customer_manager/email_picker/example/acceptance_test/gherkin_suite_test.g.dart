// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gherkin_suite_test.dart';

// **************************************************************************
// GherkinSuiteTestGenerator
// **************************************************************************

class _CustomGherkinIntegrationTestRunner extends GherkinIntegrationTestRunner {
  _CustomGherkinIntegrationTestRunner({
    required FlutterTestConfiguration configuration,
    required StartAppFn appMainFunction,
    required Timeout scenarioExecutionTimeout,
    AppLifecyclePumpHandlerFn? appLifecyclePumpHandler,
    LiveTestWidgetsFlutterBindingFramePolicy? framePolicy,
  }) : super(
          configuration: configuration,
          appMainFunction: appMainFunction,
          scenarioExecutionTimeout: scenarioExecutionTimeout,
          appLifecyclePumpHandler: appLifecyclePumpHandler,
          framePolicy: framePolicy,
        );

  @override
  void onRun() {
    testFeature0();
  }

  void testFeature0() {
    runFeature(
      name: 'Pick Email:',
      tags: <String>[],
      run: () {
        runScenario(
          name: 'Filled Email Should not be empty',
          description: null,
          path:
              '/Volumes/DGM/Chakavak/mc_crud/email_picker/example/./acceptance_test/features/email.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given I tap the "email" field',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'When I tap the "otherInput" field',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Then I expect the text "Email is Required!" to be present',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onBefore: () async => onBeforeRunFeature(
            name: 'Pick Email',
            path:
                '/Volumes/DGM/Chakavak/mc_crud/email_picker/example/./acceptance_test/features/email.feature',
            description: null,
            tags: <String>[],
          ),
        );

        runScenario(
          name: 'Filled Email with wrong format is not valid',
          description: null,
          path:
              '/Volumes/DGM/Chakavak/mc_crud/email_picker/example/./acceptance_test/features/email.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given I tap the "email" field',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'When I fill the "email" field with "someonecom"',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Then I expect the text "Please ensure the email entered is valid!" to be present',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name: 'Filled Email with right format is valid',
          description: null,
          path:
              '/Volumes/DGM/Chakavak/mc_crud/email_picker/example/./acceptance_test/features/email.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given I tap the "email" field',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'When I fill the "email" field with "someone@gmail.com"',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'Then I expect the text "Please ensure the email entered is valid!" to be absent',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onAfter: () async => onAfterRunFeature(
            name: 'Pick Email',
            path:
                '/Volumes/DGM/Chakavak/mc_crud/email_picker/example/./acceptance_test/features/email.feature',
            description: null,
            tags: <String>[],
          ),
        );
      },
    );
  }
}

void executeTestSuite({
  required FlutterTestConfiguration configuration,
  required StartAppFn appMainFunction,
  Timeout scenarioExecutionTimeout = const Timeout(const Duration(minutes: 10)),
  AppLifecyclePumpHandlerFn? appLifecyclePumpHandler,
  LiveTestWidgetsFlutterBindingFramePolicy? framePolicy,
}) {
  _CustomGherkinIntegrationTestRunner(
    configuration: configuration,
    appMainFunction: appMainFunction,
    appLifecyclePumpHandler: appLifecyclePumpHandler,
    scenarioExecutionTimeout: scenarioExecutionTimeout,
    framePolicy: framePolicy,
  ).run();
}
