import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mc_crud/mc_crud.dart';

void main() {
  group('email_form_bloc_tests', () {
    blocTest(
      'test email bloc changed with empty string',
      build: () => EmailBloc(),
      act: (bloc) => bloc.add(
        const EmailChanged(
          email: Email(emailString: ""),
        ),
      ),
      expect: () => [
        const EmailFormState(
          email: EmailInput.dirty(''),
          status: FormzStatus.invalid,
        ),
      ],
    );
    blocTest(
      'test email bloc changed with wrong string',
      build: () => EmailBloc(),
      act: (bloc) => bloc.add(
        const EmailChanged(
          email: Email(emailString: "asddfs"),
        ),
      ),
      expect: () => [
        const EmailFormState(
          email: EmailInput.dirty('asddfs'),
          status: FormzStatus.invalid,
        )
      ],
    );
    blocTest(
      'test email bloc changed with right string',
      build: () => EmailBloc(),
      act: (bloc) => bloc.add(
        const EmailChanged(
          email: Email(emailString: "abc@def.com"),
        ),
      ),
      expect: () => [
        const EmailFormState(
          email: EmailInput.dirty('abc@def.com'),
          status: FormzStatus.valid,
        ),
      ],
    );
    blocTest(
      'test email unfocused with right string',
      build: () => EmailBloc(),
      act: (bloc) => bloc
        ..add(
          const EmailChanged(
            email: Email(emailString: "abc@def.com"),
          ),
        )
        ..add(EmailUnfocused()),
      expect: () => [
        const EmailFormState(
          email: EmailInput.dirty('abc@def.com'),
          status: FormzStatus.valid,
        ),
      ],
    );
    blocTest(
      'test email unfocused with wrong string',
      build: () => EmailBloc(),
      act: (bloc) => bloc
        ..add(
          const EmailChanged(
            email: Email(emailString: "abcom"),
          ),
        )
        ..add(EmailUnfocused()),
      expect: () => [
        const EmailFormState(
          email: EmailInput.dirty('abcom'),
          status: FormzStatus.invalid,
        ),
      ],
    );
    blocTest(
      'test email unfocused with empty string',
      build: () => EmailBloc(),
      act: (bloc) => bloc.add(EmailUnfocused()),
      expect: () => [
        const EmailFormState(
          email: EmailInput.dirty(''),
          status: FormzStatus.invalid,
        ),
      ],
    );
  });
}
