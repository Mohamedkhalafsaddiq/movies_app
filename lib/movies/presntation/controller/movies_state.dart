import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utiles/enums.dart';
import 'package:movies_app/movies/domain/entites/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequistState nowPlayingState;
  final String nowPlayingMessage;

  final List<Movie> populerMovies;
  final RequistState populerState;
  final String popularMessage;

  final List<Movie> topRatedMovies;
  final RequistState topRetadState;
  final String topRetadMessage;

  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequistState.loading,
    this.nowPlayingMessage = '',
    this.populerMovies = const [],
    this.populerState = RequistState.loading,
    this.popularMessage = '',
    this.topRatedMovies = const [],
    this.topRetadState = RequistState.loading,
    this.topRetadMessage = '',
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequistState? nowPlayingState,
    String? nowPlayingMessage,

    List<Movie>? populerMovies,
    RequistState? populerState,
    String? popularMessage,

    List<Movie>? topRatedMovies,
    RequistState? topRetadState,
    String? topRetadMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,

      popularMessage: popularMessage ?? this.popularMessage,
      populerState: populerState ?? this.populerState,
      populerMovies: populerMovies ?? this.populerMovies,

      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRetadMessage: topRetadMessage ?? this.topRetadMessage,
      topRetadState: topRetadState ?? this.topRetadState,
    );
  }

  @override
  List<Object?> get props => [
    nowPlayingMovies,
    nowPlayingState,
    nowPlayingMessage,
    populerMovies,
    populerState,
    popularMessage,
    topRetadMessage,
    topRetadState,
    topRatedMovies,
  ];
}
