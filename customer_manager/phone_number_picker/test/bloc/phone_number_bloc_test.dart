import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:phone_number_picker/phone_number_picker.dart';

void main() {
  group('phoneNumber bloc tests', () {
    blocTest(
      'empty phone number',
      build: () => PhoneNumberBloc(),
      act: (bloc) => bloc.add(
        PhoneNumberUnfocused(),
      ),
      expect: () => [
        const PhoneNumberState(
          phoneNumber: PhoneNumber(
            isoCode: IsoCode.US,
            nsn: '',
          ),
          status: false,
        ),
      ],
    );
    blocTest(
      'wrong phone number',
      build: () => PhoneNumberBloc(),
      act: (bloc) => bloc.add(
        const PhoneNumberChanged(
            phoneNumber: PhoneNumber(
          isoCode: IsoCode.IR,
          nsn: '12345',
        )),
      ),
      expect: () => [
        const PhoneNumberState(
          phoneNumber: PhoneNumber(
            isoCode: IsoCode.IR,
            nsn: '12345',
          ),
          status: false,
        ),
      ],
    );
    blocTest(
      'right phone number',
      build: () => PhoneNumberBloc(),
      act: (bloc) => bloc.add(
        const PhoneNumberChanged(
          phoneNumber: PhoneNumber(
            isoCode: IsoCode.IR,
            nsn: '9127606447',
          ),
        ),
      ),
      expect: () => [
        const PhoneNumberState(
          phoneNumber: PhoneNumber(
            isoCode: IsoCode.IR,
            nsn: '9127606447',
          ),
          status: true,
        ),
      ],
    );
  });
}
