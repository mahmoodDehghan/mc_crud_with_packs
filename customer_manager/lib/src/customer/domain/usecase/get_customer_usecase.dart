import 'package:customer_manager/customer_manager.dart';

abstract class GetCustomerUsecase {
  Future<GeneralResult<Customer>> getCustomer(int id);
}
