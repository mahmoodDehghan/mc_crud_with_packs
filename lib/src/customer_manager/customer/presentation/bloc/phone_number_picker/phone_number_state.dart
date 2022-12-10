part of 'phone_number_bloc.dart';

class PhoneNumberState extends Equatable {
  const PhoneNumberState({
    required this.phoneNumber,
    this.status = false,
    this.pure = true,
  });

  final PhoneNumber phoneNumber;
  final bool status;
  final bool pure;

  PhoneNumberState copyWith({
    PhoneNumber? phoneNumber,
    bool? status,
  }) {
    return PhoneNumberState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      status: status ?? this.status,
      pure: false,
    );
  }

  @override
  List<Object> get props => [phoneNumber];

  @override
  bool get stringify => true;
}
