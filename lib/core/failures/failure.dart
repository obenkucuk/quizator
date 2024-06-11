import 'package:equatable/equatable.dart';

abstract class IFailure extends Equatable {
  final String message;

  const IFailure({required this.message});

  @override
  List<Object?> get props => [message];
}

class ServerFailure extends IFailure {
  const ServerFailure({super.message = 'Server Failure'});
}

class NetworkFailure extends IFailure {
  const NetworkFailure({super.message = 'Check your internet connection'});
}

class FirebaseAuthFailure extends IFailure {
  const FirebaseAuthFailure({super.message = 'Firebase Failure'});
}
