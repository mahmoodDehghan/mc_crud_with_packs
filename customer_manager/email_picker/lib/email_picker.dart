library flutter_pack_template;

export 'src/model/email.dart' show Email;
export 'src/model/email_input.dart' show EmailInput;
export 'src/model/email_input.dart' show EmailInputError;
export 'src/bloc/email_form_bloc.dart'
    show EmailBloc, EmailChanged, EmailUnfocused, EmailFormState;
export 'src/presentation/atom/email_input_widget.dart' show EmailInputWidget;

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}
