import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';

abstract class BaseUseCase<T, parameters> {
  Future<Either<Failure, T>> call(parameters params);
}

class NoParameters extends Equatable {
  const NoParameters();
  
  @override
  List<Object?> get props => [];
  
  
  
}
