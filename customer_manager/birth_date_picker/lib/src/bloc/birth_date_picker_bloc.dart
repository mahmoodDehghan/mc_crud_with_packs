import 'package:birth_date_picker/src/model/birth_date.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'birth_date_picker_state.dart';
part 'birth_date_picker_event.dart';

class BirthDatePickerBloc
    extends Bloc<BirthDatePickerEvent, BirthDatePickerState> {
  BirthDatePickerBloc() : super(BirthDatePickerState()) {
    on<BirthDateChanged>(_onBirthDateChanged);
  }

  void _onBirthDateChanged(
      BirthDateChanged event, Emitter<BirthDatePickerState> emit) {
    emit(
      state.copyWith(
        date: event.birthDate,
        dateChanged: true,
      ),
    );
  }
}
