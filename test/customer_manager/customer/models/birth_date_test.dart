import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mc_crud/mc_crud.dart';

void main() {
  test('string date format test', () {
    const dateString = 'October 10, 2022';
    final date = DateFormat.yMMMMd().parse(dateString);
    final bd = BirthDate(
      birthDate: date,
    );
    expect(bd.birthDate, date);
    expect(bd.birthDateString, dateString);
  });
}
