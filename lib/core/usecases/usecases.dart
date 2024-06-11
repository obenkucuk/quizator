import 'package:equatable/equatable.dart';
import 'package:fpdart/fpdart.dart';

import '../failures/failure.dart';

abstract class IUseCases<T, P> {
  Future<Either<IFailure, T>> call(P params);
}

final class NoParams extends Equatable {
  @override
  List<Object> get props => <Object>[];
}
