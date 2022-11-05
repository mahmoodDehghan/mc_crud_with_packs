part of 'birth_date_picker_bloc.dart';

abstract class BirthDatePickerEvent extends Equatable {
  const BirthDatePickerEvent();

  @override
  List<Object> get props => [];
}

class BirthDateChanged extends BirthDatePickerEvent {
  const BirthDateChanged({
    required this.birthDate,
  });

  final BirthDate birthDate;

  @override
  List<Object> get props => [birthDate];
}
