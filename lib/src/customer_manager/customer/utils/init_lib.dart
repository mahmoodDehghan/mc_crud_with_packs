import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mc_crud/mc_crud.dart';

class CustomerManagerInit {
  // static LocalizationsDelegate<dynamic> localizationDelegate =
  //     CustomerLocalizations.delegate;

  static Future<void> initCustomerLib() async {
    configureDependencies();
    await Hive.initFlutter();
  }

  static final customerRoutes = <GoRoute>[
    GoRoute(
        path: CustomersListPage.routeName,
        builder: (BuildContext context, GoRouterState state) => BlocProvider(
              create: (context) => CustomerFormBloc(),
              child: const CustomersListPage(),
            ),
        routes: <GoRoute>[
          GoRoute(
            name: CustomerDetailPage.routeName,
            path: '${CustomerDetailPage.routeName}:cid',
            builder: (BuildContext context, GoRouterState state) {
              return CustomerDetailPage(
                cid: state.params['cid']!,
              );
            },
          ),
          GoRoute(
            path: '${CustomerFormPage.routeName}:cid',
            builder: (context, state) => MultiBlocProvider(
              providers: [
                BlocProvider<EmailBloc>(
                  create: (context) => EmailBloc(),
                ),
                BlocProvider<BirthDatePickerBloc>(
                  create: (context) => BirthDatePickerBloc(),
                ),
                BlocProvider<BankAccountBloc>(
                  create: (context) => BankAccountBloc(),
                ),
                BlocProvider<PhoneNumberBloc>(
                  create: (context) => PhoneNumberBloc(),
                ),
                BlocProvider<FullNameBloc>(
                  create: (context) => FullNameBloc(),
                ),
                BlocProvider(
                  create: (context) => CustomerFormBloc(),
                ),
              ],
              child: CustomerFormPage(
                cid: state.params['cid']!,
              ),
            ),
          )
        ])
  ];
}
