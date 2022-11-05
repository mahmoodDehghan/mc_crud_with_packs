import 'package:customer_manager/customer_manager.dart';

class MapperUtils {
  static GeneralResult<Customer> mapResult(CustomerDTO result) {
    try {
      return GeneralResult.successResult<Customer>(
        CustomerMapper().map(result),
      );
    } catch (e) {
      return GeneralResult.failedResult<Customer>(
        e.toString(),
      );
    }
  }

  static GeneralResult<List<Customer>> mapResults(List<CustomerDTO> result) {
    try {
      return GeneralResult.successResult<List<Customer>>(
        result
            .map(
              (e) => CustomerMapper().map(e),
            )
            .toList(),
      );
    } catch (e) {
      return GeneralResult.failedResult<List<Customer>>(
        e.toString(),
      );
    }
  }
}
