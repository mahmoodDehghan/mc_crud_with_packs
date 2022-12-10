import 'package:injectable/injectable.dart';
import 'package:mc_crud/mc_crud.dart';

@Injectable(as: CreateCustomerUsecase)
class CreateCustomerUsecaseImpl implements CreateCustomerUsecase {
  final CustomerRepository localRep;

  CreateCustomerUsecaseImpl(@Named(DefaultConsts.localRep) this.localRep);

  @override
  Future<GeneralResult<Customer>> createCustomer(Map<String, dynamic> entry) {
    return localRep.createCustomer(entry);
  }
}
