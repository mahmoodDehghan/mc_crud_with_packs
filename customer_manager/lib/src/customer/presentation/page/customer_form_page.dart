import 'package:customer_manager/src/customer/presentation/provider/customer_form_provider.dart';
import 'package:flutter/material.dart';

class CustomerFormPage extends StatelessWidget {
  static const String routeName = 'form';

  const CustomerFormPage({
    Key? key,
    required this.cid,
  }) : super(key: key);

  final String cid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: CustomerFormProvider(
            cid: cid,
          ),
        ),
      ),
    );
  }
}
