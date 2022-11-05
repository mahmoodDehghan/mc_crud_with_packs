import 'package:customer_manager/customer_manager.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: GetAllCustomerUsecase)
class GetAllCustomerUseCaseImpl implements GetAllCustomerUsecase {
  final CustomerRepository localRep;

  GetAllCustomerUseCaseImpl(@Named(DefaultConsts.localRep) this.localRep);

  @override
  Future<GeneralResult<List<Customer>>> getCustomersList() {
    return localRep.getAllCustomers();
  }
}
