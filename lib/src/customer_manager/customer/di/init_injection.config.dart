// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../../../mc_crud.dart' as _i3;
import 'repository/customer_repository_impl.dart' as _i4;
import 'usecase/create_customer_usecase_impl.dart' as _i9;
import 'usecase/delete_customer_usecase_impl.dart' as _i5;
import 'usecase/get_all_customer_usecase_impl.dart' as _i6;
import 'usecase/get_customer_usecase_impl.dart' as _i7;
import 'usecase/update_customer_usecase_impl.dart'
    as _i8; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.singleton<_i3.CustomerRepository>(
    _i4.CustomerLocalRespositoryImpl(),
    instanceName: 'localRep',
  );
  gh.factory<_i3.DeleteCustomerUsecase>(() => _i5.DeleteCustomerUsecaseImpl(
      get<_i3.CustomerRepository>(instanceName: 'localRep')));
  gh.factory<_i3.GetAllCustomerUsecase>(() => _i6.GetAllCustomerUseCaseImpl(
      get<_i3.CustomerRepository>(instanceName: 'localRep')));
  gh.factory<_i3.GetCustomerUsecase>(() => _i7.GetCustomerUsecaseImpl(
      get<_i3.CustomerRepository>(instanceName: 'localRep')));
  gh.factory<_i3.UpdateCustomerUsecase>(() => _i8.UpdateCustomerUsecaseImpl(
      get<_i3.CustomerRepository>(instanceName: 'localRep')));
  gh.factory<_i3.CreateCustomerUsecase>(() => _i9.CreateCustomerUsecaseImpl(
      get<_i3.CustomerRepository>(instanceName: 'localRep')));
  return get;
}
