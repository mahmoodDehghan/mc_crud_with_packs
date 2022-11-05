import 'package:bank_account_picker/bank_account_picker.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const BankAccountWidget(),
          const SizedBox(
            height: 20,
          ),
          TextFormField(
            key: const ValueKey('otherInput'),
          )
        ],
      ),
    );
  }
}
