// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: unnecessary_const

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
              '/Volumes/DGM/masonchase/mc_crud/./acceptance_test/features/customer_manager.feature',
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
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'THEN 1 customer with these details is created:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onBefore: () async => onBeforeRunFeature(
            name: 'Customer Management',
            path:
                '/Volumes/DGM/masonchase/mc_crud/./acceptance_test/features/customer_manager.feature',
            description: null,
            tags: <String>[],
          ),
        );

        runScenario(
          name: 'Create a customer with same email is not allowed',
          description: null,
          path:
              '/Volumes/DGM/masonchase/mc_crud/./acceptance_test/features/customer_manager.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'GIVEN create a customer with these details:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'WHEN user fills and submit the form with: firstName:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"Ali","lastName":"Alavi","birthDate":"July 17, 1999","email":"mdm1369@gmail.com","phoneNumber":"+989127606448","bankAccountNumber":"IR110570033780012635008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'THEN 0 customer with these details is created:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"Ali","lastName":"Alavi","birthDate":"July 17, 1999","email":"mdm1369@gmail.com","phoneNumber":"+989127606448","bankAccountNumber":"IR110570033780012635008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name:
              'Create a customer with same name and lastName and birthDate is not allowed',
          description: null,
          path:
              '/Volumes/DGM/masonchase/mc_crud/./acceptance_test/features/customer_manager.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'GIVEN create a customer with these details:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'WHEN user fills and submit the form with:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm@gmail.com","phoneNumber":"+989137606447","bankAccountNumber":"IR110670033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'THEN 0 customer with these details is created:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm@gmail.com","phoneNumber":"+989137606447","bankAccountNumber":"IR110670033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name: 'Create a customer with wrong email format is not allowed',
          description: null,
          path:
              '/Volumes/DGM/masonchase/mc_crud/./acceptance_test/features/customer_manager.feature',
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
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369mail.com","phoneNumber":"+989137606447","bankAccountNumber":"IR110670033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'THEN 0 customer with these details is created:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369mail.com","phoneNumber":"+989137606447","bankAccountNumber":"IR110670033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name:
              'Create a customer with wrong MobileNumber format is not allowed',
          description: null,
          path:
              '/Volumes/DGM/masonchase/mc_crud/./acceptance_test/features/customer_manager.feature',
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
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+982122532774","bankAccountNumber":"IR110670033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'THEN 0 customer with these details is created:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+982122532774","bankAccountNumber":"IR110670033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name:
              'Create a customer with wrong bankAccountNumber format is not allowed',
          description: null,
          path:
              '/Volumes/DGM/masonchase/mc_crud/./acceptance_test/features/customer_manager.feature',
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
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989137606447","bankAccountNumber":"IR110"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'THEN 0 customer with these details is created:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989137606447","bankAccountNumber":"IR110"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name:
              'Create a customer with an empty field is not allowed-all fields required',
          description: null,
          path:
              '/Volumes/DGM/masonchase/mc_crud/./acceptance_test/features/customer_manager.feature',
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
                    '[{"firstName":"[blank]","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'THEN 0 customer with these details is created:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"[blank]","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name: 'Read a customer details',
          description: null,
          path:
              '/Volumes/DGM/masonchase/mc_crud/./acceptance_test/features/customer_manager.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'GIVEN create a customer with these details:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'WHEN user request get a customer with these details:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'THEN customer with these details loaded:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name: 'Read all customers',
          description: null,
          path:
              '/Volumes/DGM/masonchase/mc_crud/./acceptance_test/features/customer_manager.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'GIVEN create a customer with these details:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'WHEN user request get all customers',
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
                name: 'THEN customers list loaded with:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name: 'Read empty customers list',
          description: null,
          path:
              '/Volumes/DGM/masonchase/mc_crud/./acceptance_test/features/customer_manager.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'WHEN user request get all customers',
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
                name: 'THEN there is no customer in list',
                multiLineStrings: <String>[],
                table: null,
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name: 'Update a customer with correct entries',
          description: null,
          path:
              '/Volumes/DGM/masonchase/mc_crud/./acceptance_test/features/customer_manager.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'GIVEN create a customer with these details:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'WHEN user updates a first customer to these details:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghani","birthDate":"July 17, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'THEN there is 0 customer with these details:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'BUT there is 1 customer with these details:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghani","birthDate":"July 17, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name: 'Update a customer with same email is not allowed',
          description: null,
          path:
              '/Volumes/DGM/masonchase/mc_crud/./acceptance_test/features/customer_manager.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'GIVEN create a customer with these details:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'AND create a customer with these details:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"Ali","lastName":"Alavi","birthDate":"July 18, 1990","email":"mdm@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'WHEN user updates a first customer to these details:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'THEN there is 0 customer with these details:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'BUT there is 1 customer with these details:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name:
              'Update a customer with same name and lastName and birthDate is not allowed',
          description: null,
          path:
              '/Volumes/DGM/masonchase/mc_crud/./acceptance_test/features/customer_manager.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'GIVEN create a customer with these details:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'AND create a customer with these details:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"Ali","lastName":"Alavi","birthDate":"July 18, 1990","email":"mdm@gmail.com","phoneNumber":"+989127606441","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'WHEN user updates a first customer to these details:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"Ali","lastName":"Alavi","birthDate":"July 18, 1990","email":"mdm1234@gmail.com","phoneNumber":"+989157606440","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'THEN there is 0 customer with these details:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"Ali","lastName":"Alavi","birthDate":"July 18, 1990","email":"mdm1234@gmail.com","phoneNumber":"+989157606440","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'BUT there is 1 customer with these details:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
        );

        runScenario(
          name: 'Delete a customer',
          description: null,
          path:
              '/Volumes/DGM/masonchase/mc_crud/./acceptance_test/features/customer_manager.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'GIVEN create a customer with these details:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'WHEN user delete a customer with these details:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'THEN there is 0 customer with these details:',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"firstName":"mahmood","lastName":"dehghan","birthDate":"July 16, 1990","email":"mdm1369@gmail.com","phoneNumber":"+989127606447","bankAccountNumber":"IR110570033780012625008101"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
          ],
          onAfter: () async => onAfterRunFeature(
            name: 'Customer Management',
            path:
                '/Volumes/DGM/masonchase/mc_crud/./acceptance_test/features/customer_manager.feature',
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
