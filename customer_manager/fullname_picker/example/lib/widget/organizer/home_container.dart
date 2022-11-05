import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:fullname_picker/fullname_picker.dart';

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final fBloc = FullNameBloc();
    return BlocProvider(
      create: (context) => fBloc,
      child: Center(
        child: Column(
          children: [
            // const FirstNameInputWidget(),
            // const SizedBox(
            //   height: 20,
            // ),
            // const LastNameInputWidget(),
            const FullNameFields(
              hasBloc: true,
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<FullNameBloc, FullNameFormState>(
                builder: (context, state) {
              return Text(state.status == FormzStatus.valid
                  ? "Hello ${state.fullName.fullName}!"
                  : "");
            })
          ],
        ),
      ),
    );
  }
}
