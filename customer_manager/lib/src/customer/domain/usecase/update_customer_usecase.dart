import 'package:customer_manager/customer_manager.dart';

abstract class UpdateCustomerUsecase {
  Future<GeneralResult<bool>> updateCustomer(
      int id, Map<String, dynamic> entry);
}
