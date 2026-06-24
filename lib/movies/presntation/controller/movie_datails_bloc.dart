import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utiles/enums.dart';
import 'package:movies_app/movies/domain/entites/movie_datails.dart';
import 'package:movies_app/movies/domain/entites/recomendation.dart';
import 'package:movies_app/movies/domain/use_case/get_movie_use_case.dart';
import 'package:movies_app/movies/domain/use_case/get_recommendation_use_case.dart';

part 'movie_datails_event.dart';
part 'movie_datails_state.dart';

class MovieDatailsBloc extends Bloc<MovieDatailsEvent, MovieDatailsState> {
  MovieDatailsBloc(
    this.getMovieDatailsUseCase,
    this.getMovieRecommendationsUseCase,
  ) : super(const MovieDatailsState()) {
    on<GetMovieDatailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationsEvent>(_getMovieRecommendations);
  }
  final GetMovieDatailsUseCase getMovieDatailsUseCase;
  final GetRecommendationUseCase getMovieRecommendationsUseCase;

  FutureOr<void> _getMovieDetails(
    GetMovieDatailsEvent event,
    Emitter<MovieDatailsState> emit,
  ) async {
    final result = await getMovieDatailsUseCase(
      MovieDetailsParameters(event.id),
    );

    result.fold(
      (l) => emit(state.copyWith(movieDatailsState: RequistState.error)),
      (result) => emit(
        state.copyWith(
          movieDatails: result,
          movieDatailsState: RequistState.loaded,
        ),
      ),
    );
  }

  FutureOr<void> _getMovieRecommendations(
    GetMovieRecommendationsEvent event,
    Emitter<MovieDatailsState> emit,
  ) async {
    final result = await getMovieRecommendationsUseCase(
      RecomndationParametars(id: event.id),
    );

    result.fold(
      (l) => emit(
        state.copyWith(
          recommendationState: RequistState.error,
          recommendationMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          recommendation: r,
          recommendationState: RequistState.loaded,
        ),
      ),
    );
  }
}
