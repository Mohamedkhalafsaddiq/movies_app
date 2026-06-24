import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/use_case/base_use_case.dart';
import 'package:movies_app/core/utiles/enums.dart';
import 'package:movies_app/movies/domain/use_case/get_now_playing_usecase.dart';
import 'package:movies_app/movies/domain/use_case/get_populer_usecase.dart';
import 'package:movies_app/movies/domain/use_case/get_top_reated_usecase.dart';
import 'package:movies_app/movies/presntation/controller/movies_event.dart';
import 'package:movies_app/movies/presntation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingUsecase getNowPlayingUsecase;
  final GetPopulerUsecase getPopulerUsecase;
  final GetTopReatedUsecase getTopRatedUsecase;

  MoviesBloc(
    this.getNowPlayingUsecase,
    this.getPopulerUsecase,
    this.getTopRatedUsecase,
  ) : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  Future<void> _getNowPlayingMovies(
    GetNowPlayingMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getNowPlayingUsecase(const NoParameters());

    emit(const MoviesState(nowPlayingState: RequistState.loaded));
    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingMessage: l.message,
          nowPlayingState: RequistState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingState: RequistState.loaded,
          nowPlayingMovies: r,
        ),
      ),
    );
  }

  Future<void> _getPopularMovies(
    GetPopularMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getPopulerUsecase(const NoParameters());

    result.fold(
      (l) => emit(
        state.copyWith(
          populerState: RequistState.error,
          popularMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(populerState: RequistState.loaded, populerMovies: r),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(
    GetTopRatedMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getTopRatedUsecase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          topRetadState: RequistState.error,
          topRetadMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(topRetadState: RequistState.loaded, topRatedMovies: r),
      ),
    );
  }
}
