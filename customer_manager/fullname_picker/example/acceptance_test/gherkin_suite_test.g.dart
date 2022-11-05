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
      name: 'FullName:',
      tags: <String>[],
      run: () {
        runScenario(
          name: 'first name is required!',
          description: null,
          path:
              'C:\\chakavack\\mc_crud\\fullname_picker\\example\\.\\acceptance_test\\features\\fullname.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'GIVEN I tap the "firstName" field',
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
                name: 'WHEN I tap the "lastName" field',
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
                    'THEN I expect the text "FirstName is Required!" to be present',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onBefore: () async => onBeforeRunFeature(
            name: 'FullName',
            path:
                'C:\\chakavack\\mc_crud\\fullname_picker\\example\\.\\acceptance_test\\features\\fullname.feature',
            description: null,
            tags: <String>[],
          ),
        );

        runScenario(
          name: 'last name is required!',
          description: null,
          path:
              'C:\\chakavack\\mc_crud\\fullname_picker\\example\\.\\acceptance_test\\features\\fullname.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'GIVEN I tap the "lastName" field',
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
                name: 'WHEN I tap the "firstName" field',
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
                    'THEN I expect the text "LastName is Required!" to be present',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name: 'when both filled right the fullName is apeared',
          description: null,
          path:
              'C:\\chakavack\\mc_crud\\fullname_picker\\example\\.\\acceptance_test\\features\\fullname.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name:
                    'GIVEN I expect the "lastName" field and "firstName" field to be present',
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
                    'WHEN I fill the "firstName" field with "Mahmood" and I fill the "lastName" with "Dehghan"',
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
                    'THEN I expect the text "Hello Mahmood Dehghan!" to be present',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onAfter: () async => onAfterRunFeature(
            name: 'FullName',
            path:
                'C:\\chakavack\\mc_crud\\fullname_picker\\example\\.\\acceptance_test\\features\\fullname.feature',
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
