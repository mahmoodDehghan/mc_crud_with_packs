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
      name: 'Create Read Edit Delete Customer:',
      tags: <String>[],
      run: () {
        runScenario(
          name: 'Create Read Edit Delete Customer',
          description: null,
          path:
              '/Volumes/DGM/bdd/mc_crud/./acceptance_test/features/customer_manager_mc.feature',
          tags: <String>['@ignore'],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given system error codes are following',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"Code":"101","Description":"Invalid Mobile Number"},{"Code":"102","Description":"Invalid Email address"},{"Code":"103","Description":"Invalid Bank Account Number"},{"Code":"201","Description":"Duplicate customer by First-name- Last-name- Date-of-Birth"},{"Code":"202","Description":"Duplicate customer by Email address"}]'),
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
                    'When user creates a customer with following data by clicking submit and typing below data',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"FirstName":"John","LastName":"Doe","Email":"john@doe.com","PhoneNumber":"+989121234567","DateOfBirth":"01-JAN-2000","BankAccountNumber":"IR000000000000001"}]'),
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
                    'Then user can get list of all customers and there must be "1" record with below details',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"FirstName":"John","LastName":"Doe","Email":"john@doe.com","PhoneNumber":"+989121234567","DateOfBirth":"01-JAN-2000","BankAccountNumber":"IR000000000000001"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'When user edit customer with new data',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"FirstName":"Jane","LastName":"William","Email":"jane@william.com","PhoneNumber":"+3161234567","DateOfBirth":"01-FEB-2010","BankAccountNumber":"IR000000000000002"}]'),
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
                    'Then user can get list of all customers and there must be "0" record with below details',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"FirstName":"John","LastName":"Doe","Email":"john@doe.com","PhoneNumber":"+989121234567","DateOfBirth":"01-JAN-2000","BankAccountNumber":"IR000000000000001"}]'),
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
                    'And user can get list of all customers and there must be "1" record with below details',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"FirstName":"Jane","LastName":"William","Email":"jane@william.com","PhoneNumber":"+3161234567","DateOfBirth":"01-FEB-2010","BankAccountNumber":"IR000000000000002"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'When user delete customer by Email of "new@email.com"',
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
                name: 'Then user can get all records and get "0" records',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onBefore: () async => onBeforeRunFeature(
            name: 'Create Read Edit Delete Customer',
            path:
                '/Volumes/DGM/bdd/mc_crud/./acceptance_test/features/customer_manager_mc.feature',
            description: null,
            tags: <String>[],
          ),
          onAfter: () async => onAfterRunFeature(
            name: 'Create Read Edit Delete Customer',
            path:
                '/Volumes/DGM/bdd/mc_crud/./acceptance_test/features/customer_manager_mc.feature',
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
