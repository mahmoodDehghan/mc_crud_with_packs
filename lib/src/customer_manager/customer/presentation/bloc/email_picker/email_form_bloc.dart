import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:mc_crud/mc_crud.dart';

part 'email_form_event.dart';
part 'email_form_state.dart';

class EmailBloc extends Bloc<EmailFormEvent, EmailFormState> {
  EmailBloc() : super(const EmailFormState()) {
    on<EmailChanged>(_onEmailChanged);
    on<EmailUnfocused>(_onEmailUnfocused);
  }

  void _onEmailChanged(EmailChanged event, Emitter<EmailFormState> emit) {
    final emailInput = EmailInput.dirty(event.email.emailString);
    emit(
      state.copyWith(
        email: emailInput,
        status: Formz.validate([emailInput]),
      ),
    );
  }

  void _onEmailUnfocused(EmailUnfocused event, Emitter<EmailFormState> emit) {
    final emailInput = EmailInput.dirty(state.email.value);
    emit(
      state.copyWith(
        email: emailInput,
        status: Formz.validate([emailInput]),
      ),
    );
  }
}
