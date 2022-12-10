import 'package:injectable/injectable.dart';
import 'package:mc_crud/mc_crud.dart';

@Injectable(as: GetAllCustomerUsecase)
class GetAllCustomerUseCaseImpl implements GetAllCustomerUsecase {
  final CustomerRepository localRep;

  GetAllCustomerUseCaseImpl(@Named(DefaultConsts.localRep) this.localRep);

  @override
  Future<GeneralResult<List<Customer>>> getCustomersList() {
    return localRep.getAllCustomers();
  }
}
