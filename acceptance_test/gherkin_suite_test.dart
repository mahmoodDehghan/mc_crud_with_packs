// ignore_for_file: avoid_print

import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

// The application under test.
import 'package:mc_crud/main.dart' as app;

import 'hooks/prepare_db.dart';
import 'steps/customer_details_loaded.dart';
import 'steps/customers_list_loaded.dart';
import 'steps/delete_customer.dart';
import 'steps/empty_list.dart';
import 'steps/get_all_customers.dart';
import 'steps/then_customer_created.dart';
import 'steps/update_customer.dart';
import 'steps/when_get_customer.dart';
import 'steps/when_submit_form_create.dart';
// import 'steps/choose_birth_date.dart';
// import 'steps/customer_exist.dart';
// import 'steps/message_confirm.dart';
// // import 'steps/no_customer_exist.dart';
// // import 'steps/scroll_top.dart';
// import 'steps/show_birth_date.dart';
// import 'steps/specific_date_pick.dart';
// import 'steps/tap_widget.dart';
// import 'steps/widget_presents.dart';

part 'gherkin_suite_test.g.dart';

@GherkinTestSuite(
  featurePaths: ['acceptance_test/features/**.feature'],
)
void main() {
  executeTestSuite(
    configuration: FlutterTestConfiguration(
      stepDefinitions: [
        whenSubmitFormCreate(),
        thenCustomerCreated(),
        whenGetCustomer(),
        whenGetAllCustomers(),
        whenUpdateFirstCustomer(),
        whenDeleteCustomer(),
        thenCustomersListLoaded(),
        thenCustomerDetailsLoaded(),
        thenNoCustomerExist(),
        // pickRightDate(),
        // isPresent(),
        // pickSpecificDate(),
        // customerExist(),
        // showBirthDate(),
        // tapWidget(),
        // // scrollTop(),
        // messageConfirm(),
      ],
      semanticsEnabled: false,
      hooks: [
        PrepareDB(),
      ],
      waitImplicitlyAfterAction: true,
      defaultTimeout: const Duration(seconds: 40),
      // stopAfterTestFailed: true,
      reporters: [
        StdoutReporter(MessageLevel.error)
          ..setWriteLineFn(print)
          ..setWriteFn(print),
        // ProgressReporter()
        //   ..setWriteLineFn(print)
        //   ..setWriteFn(print),
        TestRunSummaryReporter()
          ..setWriteLineFn(print)
          ..setWriteFn(print),
        // JsonReporter(
        //   writeReport: (_, __) => Future<void>.value(),
        // ),
      ],
    ),
    appMainFunction: (World world) async => app.main(),
  );
}
