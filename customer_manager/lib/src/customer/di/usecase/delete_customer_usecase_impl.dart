import 'package:customer_manager/customer_manager.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: DeleteCustomerUsecase)
class DeleteCustomerUsecaseImpl implements DeleteCustomerUsecase {
  final CustomerRepository localRep;

  DeleteCustomerUsecaseImpl(
    @Named(DefaultConsts.localRep) this.localRep,
  );

  @override
  Future<GeneralResult<bool>> deleteCustomer(int id) async {
    return localRep.deleteCustomer(id);
  }
}
