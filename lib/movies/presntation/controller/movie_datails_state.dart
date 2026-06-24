part of 'movie_datails_bloc.dart';

class MovieDatailsState extends Equatable {
  const MovieDatailsState({
    this.movieDatails,
    this.movieDatailsState = RequistState.loading,
    this.message = '',
    this.recommendation = const [],
    this.recommendationState = RequistState.loading,
    this.recommendationMessage = '',
  });

  MovieDatailsState copyWith({
    MovieDatails? movieDatails,
    RequistState? movieDatailsState,
    String? message,
    List<Recomendation>? recommendation,
    RequistState? recommendationState,
    String? recommendationMessage,
  }) {
    return MovieDatailsState(
      movieDatails: movieDatails ?? this.movieDatails,
      movieDatailsState: movieDatailsState ?? this.movieDatailsState,
      message: message ?? this.message,
      recommendation: recommendation ?? this.recommendation,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
    );
  }

  final MovieDatails? movieDatails;
  final RequistState movieDatailsState;
  final String message;
  final List<Recomendation> recommendation;
  final RequistState recommendationState;
  final String recommendationMessage;

  @override
  List<Object?> get props => [
    movieDatails,
    movieDatailsState,
    message,
    recommendation,
    recommendationState,
    recommendationMessage,
  ];
}
