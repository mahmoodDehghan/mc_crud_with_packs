part of 'birth_date_picker_bloc.dart';

class BirthDatePickerState extends Equatable {
  BirthDatePickerState({
    BirthDate? initDate,
    this.dateChanged = false,
  }) {
    date = initDate ??
        BirthDate(
          birthDate: DateTime.now().subtract(const Duration(days: 18 * 365)),
        );
    // minDate = DateTime.now().subtract(const Duration(days: 120 * 365));
    // maxDate = DateTime.now().subtract(const Duration(days: 18 * 365));
  }

  BirthDatePickerState copyWith({
    BirthDate? date,
    bool? dateChanged,
  }) {
    return BirthDatePickerState(
      dateChanged: dateChanged ?? this.dateChanged,
      initDate: date ?? this.date,
    );
  }

  late final BirthDate date;
  final bool dateChanged;
  // late final DateTime minDate;
  // late final DateTime maxDate;

  @override
  List<Object> get props => [date, dateChanged];

  @override
  bool get stringify => true;
}
