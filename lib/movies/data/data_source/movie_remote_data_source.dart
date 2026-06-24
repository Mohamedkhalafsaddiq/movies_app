import 'package:dio/dio.dart';
import 'package:movies_app/core/error/expetion.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/network/error_message_model.dart';
import 'package:movies_app/movies/data/models/movie_datails_model.dart';
import 'package:movies_app/movies/data/models/movie_model.dart';
import 'package:movies_app/movies/data/models/recommendation_model.dart';
import 'package:movies_app/movies/domain/use_case/get_movie_use_case.dart';
import 'package:movies_app/movies/domain/use_case/get_recommendation_use_case.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<MovieModel>> getNowPlayingMovies();
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getTopRatedMovies();
  Future<MovieDatailsModel> getMovieDatails(MovieDetailsParameters parameters);
  Future<List<RecommendationModel>> getRecommendation(
    RecomndationParametars parameters,
  );
}

class MovieRemoteDataSource implements BaseMovieRemoteDataSource {
  @override
  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstance.nowPlayingMoviesPath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        response.data['results'].map((x) => MovieModel.fromJson(x)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response = await Dio().get(ApiConstance.popularMoviePath);

    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        response.data['results'].map((x) => MovieModel.fromJson(x)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MovieModel>> getTopRatedMovies() async {
    final response = await Dio().get(ApiConstance.topRatedMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        response.data['results'].map((x) => MovieModel.fromJson(x)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDatailsModel> getMovieDatails(
    MovieDetailsParameters parameters,
  ) async {
    final response = await Dio().get(
      ApiConstance.movieDetailsPath(parameters.movieId),
    );

    if (response.statusCode == 200) {
      return MovieDatailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendation(
    RecomndationParametars parameters,
  ) async {
    final response = await Dio().get(
      ApiConstance.recommendationPath(parameters.id),
    );

    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
        response.data['results'].map((x) => RecommendationModel.fromJson(x)),
      );
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
