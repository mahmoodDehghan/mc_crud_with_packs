import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:formz/formz.dart';
import 'package:mc_crud/mc_crud.dart';

void main() {
  group('fullname_form_bloc_tests', () {
    blocTest(
      'test both empty string',
      build: () => FullNameBloc(),
      act: (bloc) => bloc
        ..add(
          FirstNameUnfocused(),
        )
        ..add(
          LastNameUnfocused(),
        ),
      skip: 1,
      expect: () => [
        FullNameFormState(
          firstName: const FirstNameInput.dirty(''),
          lastName: const LastNameInput.dirty(''),
          status: FormzStatus.invalid,
        ),
      ],
    );
    blocTest(
      'test firstName changed with empty string',
      build: () => FullNameBloc(),
      act: (bloc) => bloc
        ..add(
          const FirstNameChanged(
            firstName: "",
          ),
        )
        ..add(
          const LastNameChanged(
            lastName: "t",
          ),
        ),
      skip: 1,
      expect: () => [
        FullNameFormState(
          firstName: const FirstNameInput.dirty(""),
          lastName: const LastNameInput.dirty("t"),
          status: FormzStatus.invalid,
        ),
      ],
    );
    blocTest(
      'test lastName changed with empty string',
      build: () => FullNameBloc(),
      act: (bloc) => bloc
        ..add(
          const LastNameChanged(lastName: ""),
        )
        ..add(
          const FirstNameChanged(firstName: "f"),
        ),
      skip: 1,
      expect: () => [
        FullNameFormState(
          firstName: const FirstNameInput.dirty('f'),
          lastName: const LastNameInput.dirty(''),
          status: FormzStatus.invalid,
        ),
      ],
    );
    blocTest(
      'test fullname bloc changed with right string',
      build: () => FullNameBloc(),
      act: (bloc) => bloc
        ..add(
          const FirstNameChanged(firstName: "mahmoud"),
        )
        ..add(
          const LastNameChanged(lastName: "dehghan"),
        ),
      skip: 1,
      expect: () => [
        FullNameFormState(
          firstName: const FirstNameInput.dirty('mahmoud'),
          lastName: const LastNameInput.dirty('dehghan'),
          status: FormzStatus.valid,
        ),
      ],
    );
    blocTest(
      'test first Name unfocused with empty string',
      build: () => FullNameBloc(),
      act: (bloc) => bloc
        ..add(
          const LastNameChanged(
            lastName: "test",
          ),
        )
        ..add(
          FirstNameUnfocused(),
        ),
      skip: 1,
      expect: () => [
        FullNameFormState(
          firstName: const FirstNameInput.dirty(''),
          lastName: const LastNameInput.dirty('test'),
          status: FormzStatus.invalid,
        ),
      ],
    );
    blocTest(
      'test last Name unfocused with empty string',
      build: () => FullNameBloc(),
      act: (bloc) => bloc
        ..add(
          const FirstNameChanged(
            firstName: "test",
          ),
        )
        ..add(
          LastNameUnfocused(),
        ),
      skip: 1,
      expect: () => [
        FullNameFormState(
          firstName: const FirstNameInput.dirty('test'),
          lastName: const LastNameInput.dirty(''),
          status: FormzStatus.invalid,
        ),
      ],
    );
  });
}
