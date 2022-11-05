import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class BirthDate extends Equatable {
  BirthDate({
    required this.birthDate,
    String? birthString,
  }) {
    birthDateString = birthString ?? DateFormat.yMMMMd().format(birthDate);
  }

  factory BirthDate.fromString(String date) {
    return BirthDate(
      birthDate: DateFormat.yMMMMd().parse(date),
    );
  }

  late final String birthDateString;
  final DateTime birthDate;

  @override
  List<Object> get props => [birthDate, birthDateString];

  @override
  bool get stringify => true;
}
