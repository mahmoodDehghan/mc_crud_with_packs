import 'package:customer_manager/customer_manager.dart';

abstract class DeleteCustomerUsecase {
  Future<GeneralResult<bool>> deleteCustomer(int id);
}
