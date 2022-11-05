import 'package:customer_manager/customer_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(routes: [
        GoRoute(
          path: '/',
          redirect: (context, state) => '/customers',
        ),
        ...CustomerManagerInit.customerRoutes,
      ]),
      title: 'Customer Crud',
      localizationsDelegates: [
        AppLocalizations.delegate,
        CustomerManagerInit.localizationDelegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('en', ''),
      supportedLocales: const [
        Locale('en', ''),
      ],
    );
  }
}
