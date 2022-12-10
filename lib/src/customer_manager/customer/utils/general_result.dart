import 'package:equatable/equatable.dart';

class GeneralResult<T> extends Equatable {
  final T? result;
  final String? errorMessage;

  const GeneralResult({this.result, this.errorMessage});

  bool hasResult() {
    return result != null && errorMessage!.isEmpty;
  }

  static GeneralResult<T> successResult<T>(T result) {
    return GeneralResult(
      result: result,
      errorMessage: '',
    );
  }

  static GeneralResult<T> failedResult<T>(String error) {
    return GeneralResult(
      result: null,
      errorMessage: error,
    );
  }

  @override
  List<Object?> get props => [result, errorMessage];

  @override
  bool? get stringify => true;
}
