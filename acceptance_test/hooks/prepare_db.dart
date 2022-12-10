// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';
import 'package:mc_crud/mc_crud.dart';

class PrepareDB extends Hook {
  // @override
  // Future<void> onBeforeRun(TestConfiguration config) async {

  // }

  @override
  Future<void> onAfterScenario(
      TestConfiguration config, String scenario, Iterable<Tag> tags,
      {bool passed = true}) async {
    final rep = CustomerLocalRespositoryImpl();
    final cList = await GetAllCustomerUseCaseImpl(rep).getCustomersList();
    if ((cList.result ?? []).isNotEmpty) {
      for (final c in cList.result!) {
        await DeleteCustomerUsecaseImpl(rep).deleteCustomer(c.id);
      }
    }
    // return super.onAfterScenario(
    //   config,
    //   scenario,
    //   tags,
    //   passed: passed,
    // );
  }

  @override
  Future<void> onBeforeScenario(
      TestConfiguration config, String scenario, Iterable<Tag> tags) async {
    // await CustomerManagerInit.initCustomerLib();
    // await CreateCustomerUsecaseImpl(CustomerLocalRespositoryImpl())
    //     .createCustomer({
    //   JSONKeys.idKey: 1,
    //   JSONKeys.personKey: PersonDTO(
    //     id: 1,
    //     firstName: 'Mahmood',
    //     lastName: 'Dehghan',
    //     dateOfBirth: BirthDate(
    //             birthDate:
    //                 DateTime.now().subtract(const Duration(days: (19 * 365))))
    //         .birthDateString,
    //   ).toJson(),
    //   JSONKeys.emailKey: 'asdW@sad.sd',
    //   JSONKeys.bankAccountKey: '213345123',
    //   JSONKeys.phoneKey: '+989122345643',
    // });
    // return super.onBeforeScenario(config, scenario, tags);
  }
}
