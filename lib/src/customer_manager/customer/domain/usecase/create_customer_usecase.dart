import 'package:mc_crud/mc_crud.dart';

abstract class CreateCustomerUsecase {
  Future<GeneralResult<Customer>> createCustomer(
    Map<String, dynamic> entry,
  );
}
