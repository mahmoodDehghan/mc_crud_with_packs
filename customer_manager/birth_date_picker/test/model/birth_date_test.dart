import 'package:birth_date_picker/src/model/birth_date.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

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
