import 'package:customer_manager/customer_manager.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UpdateCustomerUsecase)
class UpdateCustomerUsecaseImpl implements UpdateCustomerUsecase {
  final CustomerRepository localRep;

  UpdateCustomerUsecaseImpl(@Named(DefaultConsts.localRep) this.localRep);

  @override
  Future<GeneralResult<bool>> updateCustomer(
      int id, Map<String, dynamic> entry) {
    return localRep.updateCustomer(id, entry);
  }
}
