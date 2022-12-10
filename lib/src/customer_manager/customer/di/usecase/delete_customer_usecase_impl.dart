import 'package:injectable/injectable.dart';
import 'package:mc_crud/mc_crud.dart';

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
