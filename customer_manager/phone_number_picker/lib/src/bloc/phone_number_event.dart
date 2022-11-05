part of 'phone_number_bloc.dart';

abstract class PhoneNumberEvent extends Equatable {
  const PhoneNumberEvent();

  @override
  List<Object> get props => [];
}

class PhoneNumberChanged extends PhoneNumberEvent {
  const PhoneNumberChanged({
    required this.phoneNumber,
  });

  final PhoneNumber phoneNumber;

  @override
  List<Object> get props => [
        phoneNumber,
      ];
}

class PhoneNumberUnfocused extends PhoneNumberEvent {}
