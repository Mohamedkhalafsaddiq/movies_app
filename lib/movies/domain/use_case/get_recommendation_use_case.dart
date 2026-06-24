import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/movies/domain/entites/recomendation.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetRecommendationUseCase
    extends BaseUseCase<List<Recomendation>, RecomndationParametars> {
  final BaseMoviesRepository baseMoviesRepository;

  GetRecommendationUseCase(this.baseMoviesRepository);
  @override
  Future<Either<Failure, List<Recomendation>>> call(
    RecomndationParametars parameters,
  ) async {
    return await baseMoviesRepository.getRecommendation(parameters);
  }
}

class RecomndationParametars extends Equatable {
  final int id;

  const RecomndationParametars({required this.id});

  @override
  List<Object?> get props => [id];
}
