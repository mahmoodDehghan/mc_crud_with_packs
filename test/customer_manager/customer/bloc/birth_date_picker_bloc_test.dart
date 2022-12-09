import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mc_crud/mc_crud.dart';

void main() {
  group(
    'birth_date_picker_bloc_tests',
    () {
      const String testDate = 'July 16, 1990';
      final date = DateFormat.yMMMMd().parse(testDate);
      blocTest(
        'test birth date picker bloc changed with right date',
        build: () => BirthDatePickerBloc(),
        act: (bloc) => bloc.add(
          BirthDateChanged(
            birthDate: BirthDate(
              birthDate: date,
            ),
          ),
        ),
        expect: () => [
          BirthDatePickerState(
            initDate: BirthDate(
              birthDate: date,
            ),
            dateChanged: true,
          ),
        ],
      );
    },
  );
}
