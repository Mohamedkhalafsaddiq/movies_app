import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/movies/domain/entites/movie_datails.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';

class GetMovieDatailsUseCase
    extends BaseUseCase<MovieDatails, MovieDetailsParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetMovieDatailsUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, MovieDatails>> call(
    MovieDetailsParameters params,
  ) async {
    return await baseMoviesRepository.getMovieDetails(params);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters(this.movieId);

  @override
  List<Object?> get props => [movieId];
}
