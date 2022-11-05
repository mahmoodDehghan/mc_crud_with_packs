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
      name: 'ADD A CUSTOMER:',
      tags: <String>[],
      run: () {
        runScenario(
          name: 'add customer infos and saves him in db',
          description: null,
          path:
              '/Volumes/DGM/Chakavak/mc_crud/customer_manager/example/./acceptance_test/features/one.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'GIVEN I wait until the "plus" is present',
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
                name: 'AND I tap the "plus" icon',
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
                name: 'AND I tap the "firstName" field',
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
                name: 'AND I fill the "firstName" field with "ALI"',
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
                name: 'AND I tap the "lastName" field',
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
                name: 'AND I fill the "lastName" field with "KHOSH"',
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
                name: 'AND I tap the "email" field',
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
                name: 'AND I fill the "email" field with "alikhosh@gmail.com"',
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
                name: 'AND I tap the "phone_number" field',
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
                    'AND I fill the "phone_number" field with "+989141346447"',
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
                name: 'AND I tap the "bank_account" field',
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
                name: 'AND I fill the "bank_account" field with "123453645899"',
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
                name: 'AND I tap the "changeDate" button',
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
                name: 'AND I choose birthdate from picker',
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
                name: 'WHEN I tap the "customer_save" button',
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
                name: 'THEN I long press the "bank_account" field',
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
                name: 'AND I wait until the "done_message" is present',
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
                name: 'AND I expect the text "Customer saved!" to be present',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onBefore: () async => onBeforeRunFeature(
            name: 'ADD A CUSTOMER',
            path:
                '/Volumes/DGM/Chakavak/mc_crud/customer_manager/example/./acceptance_test/features/one.feature',
            description: null,
            tags: <String>[],
          ),
          onAfter: () async => onAfterRunFeature(
            name: 'ADD A CUSTOMER',
            path:
                '/Volumes/DGM/Chakavak/mc_crud/customer_manager/example/./acceptance_test/features/one.feature',
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
