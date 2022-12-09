import 'package:mc_crud/mc_crud.dart';

abstract class UpdateCustomerUsecase {
  Future<GeneralResult<bool>> updateCustomer(
      int id, Map<String, dynamic> entry);
}
