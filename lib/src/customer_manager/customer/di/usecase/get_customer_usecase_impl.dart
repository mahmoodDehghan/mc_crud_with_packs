import 'package:injectable/injectable.dart';
import 'package:mc_crud/mc_crud.dart';

@Injectable(as: GetCustomerUsecase)
class GetCustomerUsecaseImpl implements GetCustomerUsecase {
  final CustomerRepository localRep;

  GetCustomerUsecaseImpl(@Named(DefaultConsts.localRep) this.localRep);

  @override
  Future<GeneralResult<Customer>> getCustomer(int id) {
    return localRep.getCustomer(id);
  }
}
