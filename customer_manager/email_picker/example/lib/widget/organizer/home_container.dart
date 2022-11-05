import 'package:email_picker/email_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EmailBloc(),
      child: Center(
        child: Column(
          children: [
            const EmailInputWidget(
              hasBloc: true,
            ),
            TextFormField(
              key: const ValueKey('otherInput'),
            )
          ],
        ),
      ),
    );
  }
}
