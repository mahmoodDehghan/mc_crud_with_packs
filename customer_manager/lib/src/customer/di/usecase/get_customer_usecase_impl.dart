import 'package:injectable/injectable.dart';
import 'package:customer_manager/customer_manager.dart';

@Injectable(as: GetCustomerUsecase)
class GetCustomerUsecaseImpl implements GetCustomerUsecase {
  final CustomerRepository localRep;

  GetCustomerUsecaseImpl(@Named(DefaultConsts.localRep) this.localRep);

  @override
  Future<GeneralResult<Customer>> getCustomer(int id) {
    return localRep.getCustomer(id);
  }
}
