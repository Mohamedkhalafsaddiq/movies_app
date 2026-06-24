import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repostory/movie_repostory.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repository.dart';
import 'package:movies_app/movies/domain/use_case/get_movie_use_case.dart';
import 'package:movies_app/movies/domain/use_case/get_now_playing_usecase.dart';
import 'package:movies_app/movies/domain/use_case/get_populer_usecase.dart';
import 'package:movies_app/movies/domain/use_case/get_top_reated_usecase.dart';
import 'package:movies_app/movies/presntation/controller/movie_datails_bloc.dart';
import 'package:movies_app/movies/presntation/controller/movies_bloc.dart';

import '../../movies/domain/use_case/get_recommendation_use_case.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    //bloc
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDatailsBloc(sl(), sl()));

    //use cases
    sl.registerLazySingleton(() => GetNowPlayingUsecase(sl()));
    sl.registerCachedFactory(() => GetPopulerUsecase(sl()));
    sl.registerCachedFactory(() => GetTopReatedUsecase(sl()));
    sl.registerCachedFactory(() => GetMovieDatailsUseCase(sl()));
    sl.registerCachedFactory(() => GetRecommendationUseCase(sl()));

    //repositories
    sl.registerLazySingleton<BaseMoviesRepository>(() => MovieRepostory(sl()));

    // data sources
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
      () => MovieRemoteDataSource(),
    );
  }
}
