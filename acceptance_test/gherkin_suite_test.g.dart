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
      name: 'Customer Management:',
      tags: <String>[],
      run: () {
        runScenario(
          name: 'Create a customer with correct entry',
          description: null,
          path:
              '/Volumes/DGM/masonchase/mc_crud_with_packs/./acceptance_test/features/t.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'WHEN user fills and submit the form with:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"\\"mahmood\\"","lastName":"\\"dehghan\\"","birthDate":"July 16, 1990","email":"\\"mdm1369@gmail.com\\"","phoneNumber":"\\"+989127606447\\"","bankAccountNumber":"\\"IR110570033780012625008101\\""}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'THEN 1 user with these details is created:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"\\"mahmood\\"","lastName":"\\"dehghan\\"","birthDate":"July 16, 1990","email":"\\"mdm1369@gmail.com\\"","phoneNumber":"\\"+989127606447\\"","bankAccountNumber":"\\"IR110570033780012625008101\\""}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onBefore: () async => onBeforeRunFeature(
            name: 'Customer Management',
            path:
                '/Volumes/DGM/masonchase/mc_crud_with_packs/./acceptance_test/features/t.feature',
            description: null,
            tags: <String>[],
          ),
          onAfter: () async => onAfterRunFeature(
            name: 'Customer Management',
            path:
                '/Volumes/DGM/masonchase/mc_crud_with_packs/./acceptance_test/features/t.feature',
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
