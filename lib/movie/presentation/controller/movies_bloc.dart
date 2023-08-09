import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movie/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movie/domain/usecases/get_top_rated_movies_usecase.dart';

import '../../../core/usecases/I_usecase.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_now_playing_movies_usecase.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  MoviesBloc(this.getNowPlayingUseCase, this.getPopularMoviesUseCase,
      this.getTopRatedMoviesUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);

    on<GetPopularMoviesEvent>(_getPopularMovies);

    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getTopRatedMovies(event, emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameter());
    result.fold((l) {
      emit(state.copyWith(
          topRatedMessage: l.message, topRatedState: RequestState.error));
    }, (r) {
      emit(state.copyWith(
          topRatedMovies: r, topRatedState: RequestState.loaded));
    });
  }

  FutureOr<void> _getPopularMovies(event, emit) async {
    final result = await getPopularMoviesUseCase(const NoParameter());
    result.fold((l) {
      emit(state.copyWith(
          popularMessage: l.message, popularState: RequestState.error));
    }, (r) {
      emit(state.copyWith(popularMovies: r, popularState: RequestState.loaded));
    });
  }

  FutureOr<void> _getNowPlayingMovies(event, emit) async {
    final result = await getNowPlayingUseCase(const NoParameter());
    result.fold((l) {
      emit(MoviesState(
          nowPlayingMessage: l.message, nowPlayingState: RequestState.error));
    }, (r) {
      emit(MoviesState(
          nowPlayingMovies: r, nowPlayingState: RequestState.loaded));
    });
  }
}
