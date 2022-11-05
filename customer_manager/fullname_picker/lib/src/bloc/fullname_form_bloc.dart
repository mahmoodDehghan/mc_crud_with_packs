import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:fullname_picker/fullname_picker.dart';

part 'fullname_form_state.dart';
part 'fullname_form_event.dart';

class FullNameBloc extends Bloc<FullNameFormEvent, FullNameFormState> {
  FullNameBloc() : super(FullNameFormState()) {
    on<FirstNameChanged>(_onFirstNameChanged);
    on<FirstNameUnfocused>(_onFirstNameUnfocused);
    on<LastNameChanged>(_onLastNameChanged);
    on<LastNameUnfocused>(_onLastNameUnfocused);
  }

  void _onLastNameUnfocused(
      LastNameUnfocused event, Emitter<FullNameFormState> emit) {
    final lastNameInput = LastNameInput.dirty(state.lastName.value);
    emit(
      state.copyWith(
        firstName: state.firstName,
        lastName: lastNameInput,
        status: Formz.validate([lastNameInput, state.firstName]),
      ),
    );
  }

  void _onFirstNameUnfocused(
      FirstNameUnfocused event, Emitter<FullNameFormState> emit) {
    final firstNameInput = FirstNameInput.dirty(state.firstName.value);
    emit(
      state.copyWith(
        firstName: firstNameInput,
        lastName: state.lastName,
        status: Formz.validate([firstNameInput, state.lastName]),
      ),
    );
  }

  void _onFirstNameChanged(
      FirstNameChanged event, Emitter<FullNameFormState> emit) {
    final firstNameInp = FirstNameInput.dirty(event.firstName);
    emit(
      state.copyWith(
        firstName: firstNameInp,
        lastName: state.lastName,
        status: Formz.validate(
          [firstNameInp, state.lastName],
        ),
      ),
    );
  }

  void _onLastNameChanged(
      LastNameChanged event, Emitter<FullNameFormState> emit) {
    final lastNameInp = LastNameInput.dirty(event.lastName);
    emit(
      state.copyWith(
        firstName: state.firstName,
        lastName: lastNameInp,
        status: Formz.validate(
          [state.firstName, lastNameInp],
        ),
      ),
    );
  }
}
