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
    testFeature1();
    testFeature2();
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
              '/Volumes/DGM/bdd/mc_crud/./acceptance_test/features/customer_manager_mc_correct_entries.feature',
          tags: <String>[],
          steps: [
            (
              TestDependencies dependencies,
              bool skip,
            ) async {
              return await runStep(
                name: 'Given system error codes are following',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"Code":"101","Description":"Invalid Mobile Number"},{"Code":"102","Description":"Invalid Email address"},{"Code":"103","Description":"Invalid Bank Account Number"},{"Code":"201","Description":"Duplicate customer by First-name, Last-name, Date-of-Birth"},{"Code":"202","Description":"Duplicate customer by Email address"}]'),
                dependencies: dependencies,
                skip: skip,
              );
            },
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
                name:
                    'WHEN user creates a customer with following data by clicking submit and typing below data',
                multiLineStrings: <String>[],
                table: GherkinTable.fromJson(
                    '[{"FirstName":"John","LastName":"Doe","Email":"john@doe.com","PhoneNumber":"+989121234567","DateOfBirth":"01-JAN-2000","BankAccountNumber":"IR110570033780012625008101"}]'),
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
                    '[{"FirstName":"John","LastName":"Doe","Email":"john@doe.com","PhoneNumber":"+989121234567","DateOfBirth":"01-JAN-2000","BankAccountNumber":"IR110570033780012625008101"}]'),
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
                    '[{"FirstName":"Jane","LastName":"William","Email":"jane@william.com","PhoneNumber":"+989121234557","DateOfBirth":"01-FEB-2001","BankAccountNumber":"IR110570033780012625008101"}]'),
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
                    '[{"FirstName":"John","LastName":"Doe","Email":"john@doe.com","PhoneNumber":"+989121234567","DateOfBirth":"01-JAN-2000","BankAccountNumber":"IR110570033780012625008101"}]'),
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
                    '[{"FirstName":"Jane","LastName":"William","Email":"jane@william.com","PhoneNumber":"+989121234557","DateOfBirth":"01-FEB-2001","BankAccountNumber":"IR110570033780012625008101"}]'),
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
                    'When user delete customer by Email of "jane@william.com"',
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
                '/Volumes/DGM/bdd/mc_crud/./acceptance_test/features/customer_manager_mc_correct_entries.feature',
            description: null,
            tags: <String>[],
          ),
          onAfter: () async => onAfterRunFeature(
            name: 'Create Read Edit Delete Customer',
            path:
                '/Volumes/DGM/bdd/mc_crud/./acceptance_test/features/customer_manager_mc_correct_entries.feature',
            description: null,
            tags: <String>[],
          ),
        );
      },
    );
  }

  void testFeature1() {
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
                    '[{"Code":"101","Description":"Invalid Mobile Number"},{"Code":"102","Description":"Invalid Email address"},{"Code":"103","Description":"Invalid Bank Account Number"},{"Code":"201","Description":"Duplicate customer by First-name, Last-name, Date-of-Birth"},{"Code":"202","Description":"Duplicate customer by Email address"}]'),
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

  void testFeature2() {
    runFeature(
      name: 'Customer Management:',
      tags: <String>[],
      run: () {
        runScenario(
          name: 'Create a customer with correct entry',
          description: null,
          path:
              '/Volumes/DGM/bdd/mc_crud/./acceptance_test/features/customer_manager.feature',
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
                '/Volumes/DGM/bdd/mc_crud/./acceptance_test/features/customer_manager.feature',
            description: null,
            tags: <String>[],
          ),
        );

        runScenario(
          name: 'Create a customer with same email is not allowed',
          description: null,
          path:
              '/Volumes/DGM/bdd/mc_crud/./acceptance_test/features/customer_manager.feature',
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
              '/Volumes/DGM/bdd/mc_crud/./acceptance_test/features/customer_manager.feature',
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
              '/Volumes/DGM/bdd/mc_crud/./acceptance_test/features/customer_manager.feature',
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
              '/Volumes/DGM/bdd/mc_crud/./acceptance_test/features/customer_manager.feature',
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
              '/Volumes/DGM/bdd/mc_crud/./acceptance_test/features/customer_manager.feature',
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
              '/Volumes/DGM/bdd/mc_crud/./acceptance_test/features/customer_manager.feature',
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
              '/Volumes/DGM/bdd/mc_crud/./acceptance_test/features/customer_manager.feature',
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
              '/Volumes/DGM/bdd/mc_crud/./acceptance_test/features/customer_manager.feature',
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
              '/Volumes/DGM/bdd/mc_crud/./acceptance_test/features/customer_manager.feature',
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
              '/Volumes/DGM/bdd/mc_crud/./acceptance_test/features/customer_manager.feature',
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
              '/Volumes/DGM/bdd/mc_crud/./acceptance_test/features/customer_manager.feature',
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
              '/Volumes/DGM/bdd/mc_crud/./acceptance_test/features/customer_manager.feature',
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
              '/Volumes/DGM/bdd/mc_crud/./acceptance_test/features/customer_manager.feature',
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
                '/Volumes/DGM/bdd/mc_crud/./acceptance_test/features/customer_manager.feature',
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
  // ignore: unnecessary_const
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
