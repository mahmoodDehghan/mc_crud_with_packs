import 'package:birth_date_picker/birth_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class BirthDatePickerWidget extends StatelessWidget {
  const BirthDatePickerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BirthDatePickerBloc, BirthDatePickerState>(
        builder: (context, state) {
      return ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 70),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              flex: 1,
              child: Center(
                child: ElevatedButton(
                  key: const ValueKey("changeDate"),
                  onPressed: () {
                    DatePicker.showDatePicker(
                      context,
                      showTitleActions: true,
                      minTime: DateTime.now()
                          .subtract(const Duration(days: 120 * 365)),
                      maxTime: DateTime.now()
                          .subtract(const Duration(days: 18 * 365)),
                      onConfirm: (date) {
                        context.read<BirthDatePickerBloc>().add(
                              BirthDateChanged(
                                birthDate: BirthDate(birthDate: date),
                              ),
                            );
                      },
                      currentTime: state.date.birthDate,
                      // locale: LocaleType.en,
                    );
                  },
                  child: const Text('Change Birth Date'),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Center(
                child: Text(
                  state.date.birthDateString,
                  key: const ValueKey('birthDateField'),
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
