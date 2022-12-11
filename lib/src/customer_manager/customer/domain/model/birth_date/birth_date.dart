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

  static String dateParser(String date) {
    final items = date.split('-');
    String month = items[1].toLowerCase();
    month = month.toUpperCase().substring(0, 1) + month.substring(1);
    // print('$month ${items[0]}, ${items[2]}');
    return '$month ${items[0]}, ${items[2]}';
  }

  factory BirthDate.fromStringymmmd(String date) {
    // print(DateFormat.MEd().format(DateTime.now()));
    return BirthDate(
      birthDate: DateFormat.yMMMd().parse(date),
    );
  }

  late final String birthDateString;
  final DateTime birthDate;

  @override
  List<Object> get props => [birthDate, birthDateString];

  @override
  bool get stringify => true;
}
