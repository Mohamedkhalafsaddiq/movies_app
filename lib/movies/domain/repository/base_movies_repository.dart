import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entites/movie.dart';
import 'package:movies_app/movies/domain/entites/movie_datails.dart';
import 'package:movies_app/movies/domain/entites/recomendation.dart';
import 'package:movies_app/movies/domain/use_case/get_movie_use_case.dart';
import 'package:movies_app/movies/domain/use_case/get_recommendation_use_case.dart';

abstract class BaseMoviesRepository {
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, MovieDatails>> getMovieDetails(
    MovieDetailsParameters parameters,
  );
  Future<Either<Failure, List<Recomendation>>> getRecommendation(
    RecomndationParametars parameters,
  );
}
