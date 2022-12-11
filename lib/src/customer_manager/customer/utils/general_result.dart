import 'package:equatable/equatable.dart';
import 'package:mc_crud/src/customer_manager/customer/utils/general_error.dart';

class GeneralResult<T> extends Equatable {
  final T? result;
  final GeneralError? error;

  const GeneralResult({this.result, this.error});

  bool hasResult() {
    return result != null && error!.isEmpty;
  }

  static GeneralResult<T> successResult<T>(T result) {
    return GeneralResult(
      result: result,
      error: GeneralError.empty(),
    );
  }

  static GeneralResult<T> failedResult<T>(GeneralError error) {
    return GeneralResult(
      result: null,
      error: error,
    );
  }

  @override
  List<Object?> get props => [result, error];

  @override
  bool? get stringify => true;
}
