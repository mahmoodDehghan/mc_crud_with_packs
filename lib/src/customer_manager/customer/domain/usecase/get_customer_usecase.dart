import 'package:mc_crud/mc_crud.dart';

abstract class GetCustomerUsecase {
  Future<GeneralResult<Customer>> getCustomer(int id);
}
