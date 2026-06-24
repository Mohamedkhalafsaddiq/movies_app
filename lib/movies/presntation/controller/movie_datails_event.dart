part of 'movie_datails_bloc.dart';

sealed class MovieDatailsEvent extends Equatable {
  const MovieDatailsEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDatailsEvent extends MovieDatailsEvent {
  final int id;

  const GetMovieDatailsEvent(this.id);

  @override
  List<Object> get props => [id];
}

class GetMovieRecommendationsEvent extends MovieDatailsEvent {
  final int id;

  const GetMovieRecommendationsEvent(this.id);

  @override
  List<Object> get props => [id];
}
