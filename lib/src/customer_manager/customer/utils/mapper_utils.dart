import 'package:mc_crud/mc_crud.dart';
import 'package:mc_crud/src/customer_manager/customer/utils/general_error.dart';

class MapperUtils {
  static GeneralResult<Customer> mapResult(CustomerDTO result) {
    try {
      return GeneralResult.successResult<Customer>(
        CustomerMapper().map(result),
      );
    } catch (e) {
      return GeneralResult.failedResult<Customer>(
        GeneralError(
          errorMessage: e.toString(),
          errorCode: DefaultConsts.convertErrorCode,
        ),
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
        GeneralError(
          errorMessage: e.toString(),
          errorCode: DefaultConsts.convertErrorCode,
        ),
      );
    }
  }
}
