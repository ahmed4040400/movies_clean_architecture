import 'package:get_it/get_it.dart';
import 'package:movies_app/movie/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movie/data/repositories/movie_repository.dart';
import 'package:movies_app/movie/domain/repositories/I_movie_repository.dart';
import 'package:movies_app/movie/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movie/domain/usecases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movie/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movie/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movie/presentation/controller/movie_details_bloc.dart';
import 'package:movies_app/movie/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    sl.registerFactory(() => MoviesBloc(sl(), sl(), sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl()));

    ///UseCase
    sl.registerLazySingleton<GetNowPlayingUseCase>(
        () => GetNowPlayingUseCase(sl()));

    sl.registerLazySingleton<GetPopularMoviesUseCase>(
        () => GetPopularMoviesUseCase(sl()));

    sl.registerLazySingleton<GetTopRatedMoviesUseCase>(
        () => GetTopRatedMoviesUseCase(sl()));

    sl.registerLazySingleton<GetMovieDetailsUseCase>(
        () => GetMovieDetailsUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<IMovieRepository>(() => MovieRepository(sl()));

    ///data source
    sl.registerLazySingleton<IMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
  }
}
