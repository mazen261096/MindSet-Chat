import 'package:equatable/equatable.dart';

class ErrorManager extends Equatable{
final String message;
const ErrorManager(this.message);
  @override
  // TODO: implement props
  List<Object?> get props => [message];
}

class RemoteDataError extends ErrorManager {
  const RemoteDataError(super.message);
}

class LocalDataError extends ErrorManager {
  const LocalDataError(super.message);
}