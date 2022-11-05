import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fullname_picker/fullname_picker.dart';

class FullNameFields extends StatelessWidget {
  const FullNameFields({
    Key? key,
    this.firstNameKey,
    this.lastNameKey,
    this.firstNameHelperText,
    this.firstNameRequiredError,
    this.lastNameHelperText,
    this.lastNameRequiredError,
    this.firstNameIcon,
    this.lastNameIcon,
    this.hasBloc = false,
  }) : super(key: key);

  final Key? firstNameKey;
  final Key? lastNameKey;
  final String? firstNameRequiredError;
  final String? lastNameRequiredError;
  final String? firstNameHelperText;
  final String? lastNameHelperText;
  final IconData? firstNameIcon;
  final IconData? lastNameIcon;
  final bool hasBloc;

  Widget _getFields(BuildContext context) {
    return Column(
      children: <Widget>[
        NameInputWidget(
          inputKey: firstNameKey ?? const ValueKey('firstName'),
          iconData: firstNameIcon ?? Icons.person,
          helperText: firstNameHelperText ?? "e.g. mahmood",
          requiredError: firstNameRequiredError ?? "FirstName is Required!",
          isFirstName: true,
        ),
        const SizedBox(
          height: 20,
        ),
        NameInputWidget(
          inputKey: lastNameKey ?? const ValueKey('lastName'),
          iconData: lastNameIcon ?? Icons.person_outline,
          helperText: lastNameHelperText ?? "e.g. dehghan",
          requiredError: lastNameRequiredError ?? "LastName is Required!",
          isFirstName: false,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return hasBloc
        ? _getFields(context)
        : BlocProvider(
            create: (context) => FullNameBloc(),
            child: _getFields(context),
          );
  }
}
