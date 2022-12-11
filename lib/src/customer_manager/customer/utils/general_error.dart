import 'package:equatable/equatable.dart';
import 'package:mc_crud/mc_crud.dart';

class GeneralError extends Equatable {
  const GeneralError({
    required this.errorMessage,
    required this.errorCode,
  });

  final String errorMessage;
  final int errorCode;

  factory GeneralError.empty() {
    return const GeneralError(errorMessage: '', errorCode: 0);
  }

  factory GeneralError.duplicatePerson() {
    return const GeneralError(
      errorMessage: DefaultConsts.duplicatePersonMsg,
      errorCode: DefaultConsts.duplicatePersonCode,
    );
  }

  factory GeneralError.generalError(String exception) {
    return GeneralError(
      errorMessage: exception,
      errorCode: DefaultConsts.generalProblemCode,
    );
  }

  factory GeneralError.customerNotFound() {
    return const GeneralError(
      errorMessage: DefaultConsts.notFound,
      errorCode: DefaultConsts.notFoundCode,
    );
  }

  factory GeneralError.bankAccountError() {
    return const GeneralError(
      errorMessage: DefaultConsts.bankAccountErrorMsg,
      errorCode: DefaultConsts.bankAccountErrorCode,
    );
  }

  factory GeneralError.firstNameError() {
    return const GeneralError(
      errorMessage: DefaultConsts.firstNameErrorMsg,
      errorCode: DefaultConsts.firstNameErrorCode,
    );
  }

  factory GeneralError.lastNameError() {
    return const GeneralError(
      errorMessage: DefaultConsts.lastNameErrorMsg,
      errorCode: DefaultConsts.lastNameErrorCode,
    );
  }

  factory GeneralError.birthDateError() {
    return const GeneralError(
      errorMessage: DefaultConsts.birthDateErrorMsg,
      errorCode: DefaultConsts.birthDateErrorCode,
    );
  }

  factory GeneralError.duplicateEmail() {
    return const GeneralError(
      errorMessage: DefaultConsts.duplicateEmailMsg,
      errorCode: DefaultConsts.duplicateemailCode,
    );
  }

  factory GeneralError.emailFormatError() {
    return const GeneralError(
      errorMessage: DefaultConsts.emailErrorMsg,
      errorCode: DefaultConsts.emailErrorCode,
    );
  }
  factory GeneralError.mobileFormatError() {
    return const GeneralError(
      errorMessage: DefaultConsts.mobileErrorMsg,
      errorCode: DefaultConsts.mobileErrorCode,
    );
  }

  bool get isEmpty => errorMessage.isEmpty && errorCode == 0;

  @override
  List<Object> get props => [errorMessage, errorCode];

  @override
  bool get stringify => true;
}
