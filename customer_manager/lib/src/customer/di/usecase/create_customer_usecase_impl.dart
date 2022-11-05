import 'package:customer_manager/customer_manager.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CreateCustomerUsecase)
class CreateCustomerUsecaseImpl implements CreateCustomerUsecase {
  final CustomerRepository localRep;

  CreateCustomerUsecaseImpl(@Named(DefaultConsts.localRep) this.localRep);

  @override
  Future<GeneralResult<Customer>> createCustomer(Map<String, dynamic> entry) {
    return localRep.createCustomer(entry);
  }
}
