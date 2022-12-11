import 'package:injectable/injectable.dart';
import 'package:mc_crud/mc_crud.dart';
import 'package:mc_crud/src/customer_manager/customer/utils/general_error.dart';

@Named(DefaultConsts.localRep)
@Singleton(as: CustomerRepository)
class CustomerLocalRespositoryImpl extends CustomerRepository {
  late final CustomerLocalDataSource _dataSource = CustomerLocalDataSource();

  CustomerLocalRespositoryImpl() : super();

  @override
  Future<GeneralResult<Customer>> createCustomer(
      Map<String, dynamic> entry) async {
    final res = await _dataSource.createCustomer(entry);
    if (res.hasResult()) {
      return MapperUtils.mapResult(res.result!);
    } else {
      return GeneralResult.failedResult<Customer>(res.error!);
    }
  }

  @override
  Future<GeneralResult<bool>> deleteCustomer(int id) {
    return _dataSource.deleteCustomer(id);
  }

  @override
  Future<GeneralResult<List<Customer>>> getAllCustomers() async {
    final res = await _dataSource.getAllCustomers();
    if (res.hasResult()) {
      return MapperUtils.mapResults(res.result!);
    } else {
      return GeneralResult.failedResult(res.error!);
    }
  }

  @override
  Future<GeneralResult<Customer>> getCustomer(int id) async {
    final res = await _dataSource.getCustomer(id);
    if (res.hasResult()) {
      try {
        final customer = CustomerMapper().map(res.result!);
        return GeneralResult.successResult<Customer>(customer);
      } catch (e) {
        return GeneralResult.failedResult<Customer>(
          GeneralError.generalError(
            e.toString(),
          ),
        );
      }
    }
    return GeneralResult.failedResult<Customer>(res.error!);
  }

  @override
  Future<GeneralResult<bool>> updateCustomer(
      int id, Map<String, dynamic> entry) {
    return _dataSource.updateCustomer(id, entry);
  }
}
