import 'package:mc_crud/mc_crud.dart';

abstract class DeleteCustomerUsecase {
  Future<GeneralResult<bool>> deleteCustomer(int id);
}
