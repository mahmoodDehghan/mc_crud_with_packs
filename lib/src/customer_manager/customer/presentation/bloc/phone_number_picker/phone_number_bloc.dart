import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_form_field/phone_form_field.dart';

part 'phone_number_event.dart';
part 'phone_number_state.dart';

class PhoneNumberBloc extends Bloc<PhoneNumberEvent, PhoneNumberState> {
  PhoneNumberBloc()
      : super(const PhoneNumberState(
          phoneNumber: PhoneNumber(
            isoCode: IsoCode.US,
            nsn: '',
          ),
        )) {
    on<PhoneNumberChanged>(_onPhoneNumberChanged);
    on<PhoneNumberUnfocused>(_onPhoneNumberUnfocused);
  }

  void _onPhoneNumberChanged(
      PhoneNumberChanged event, Emitter<PhoneNumberState> emit) {
    emit(
      state.copyWith(
        phoneNumber: event.phoneNumber,
        status: event.phoneNumber.isValid(),
      ),
    );
  }

  void _onPhoneNumberUnfocused(
      PhoneNumberUnfocused event, Emitter<PhoneNumberState> emit) {
    emit(
      state.copyWith(
        phoneNumber: state.phoneNumber,
        status: state.phoneNumber.isValid(),
      ),
    );
  }
}
