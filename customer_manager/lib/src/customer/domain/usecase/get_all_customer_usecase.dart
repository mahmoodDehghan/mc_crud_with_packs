import 'package:customer_manager/customer_manager.dart';

abstract class GetAllCustomerUsecase {
  Future<GeneralResult<List<Customer>>> getCustomersList();
}
