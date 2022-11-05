import 'package:customer_manager/customer_manager.dart';
import 'package:mc_crud/src/app.dart';
import 'package:flutter/material.dart';

void main() async {
  await CustomerManagerInit.initCustomerLib();
  runApp(
    const CustomerShowBlocProvider(MyApp()),
  );
}
