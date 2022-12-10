import 'package:equatable/equatable.dart';

class Email extends Equatable {
  const Email({required this.emailString});

  final String emailString;

  @override
  List<Object> get props => [emailString];

  @override
  bool get stringify => true;
}
