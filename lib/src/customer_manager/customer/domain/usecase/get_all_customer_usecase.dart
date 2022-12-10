import 'package:mc_crud/mc_crud.dart';

abstract class GetAllCustomerUsecase {
  Future<GeneralResult<List<Customer>>> getCustomersList();
}
