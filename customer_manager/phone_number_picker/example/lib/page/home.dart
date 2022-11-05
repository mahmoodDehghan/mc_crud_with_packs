import 'package:flutter/material.dart';
import 'package:phone_number_picker/phone_number_picker.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const PhoneNumberWidget(),
        const SizedBox(
          height: 20,
        ),
        TextFormField(
          key: const ValueKey('otherInput'),
        )
      ],
    ));
  }
}
