import 'package:customer_manager/customer_manager.dart';

abstract class CreateCustomerUsecase {
  Future<GeneralResult<Customer>> createCustomer(
    Map<String, dynamic> entry,
  );
}
