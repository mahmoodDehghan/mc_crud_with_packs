import 'package:customer_manager/customer_manager.dart';

abstract class CustomerRepository {
  Future<GeneralResult<Customer>> getCustomer(int id);
  Future<GeneralResult<List<Customer>>> getAllCustomers();
  Future<GeneralResult<Customer>> createCustomer(Map<String, dynamic> entry);
  Future<GeneralResult<bool>> deleteCustomer(int id);
  Future<GeneralResult<bool>> updateCustomer(
      int id, Map<String, dynamic> entry);
}
