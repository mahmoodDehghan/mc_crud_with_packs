import 'package:mc_crud/mc_crud.dart';
import 'package:flutter/material.dart';

void main() async {
  await CustomerManagerInit.initCustomerLib();
  runApp(
    const CustomerShowBlocProvider(MyApp()),
  );
}
