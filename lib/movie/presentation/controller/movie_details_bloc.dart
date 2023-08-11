import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/movie/domain/entities/recommentation.dart';
import 'package:movies_app/movie/domain/usecases/get_recommendation_usecase.dart';

import '../../../core/utils/enums.dart';
import '../../domain/entities/movie_detail.dart';
import '../../domain/usecases/get_movie_details_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  FutureOr<void> _getRecommendation(event, emit) async {
    final result =
        await getRecommendationUseCase(RecommendationParameters(event.id));
    result.fold((l) {
      emit(state.copyWith(
          recommendationState: RequestState.error,
          recommendationMessage: l.message));
    }, (r) {
      emit(state.copyWith(
          recommendation: r, recommendationState: RequestState.loaded));
    });
  }

  FutureOr<void> _getMovieDetails(event, emit) async {
    final result =
        await getMovieDetailsUseCase(MovieDetailsParameters(event.id));
    result.fold((l) {
      emit(state.copyWith(
          movieDetailsState: RequestState.error,
          movieDetailsMessage: l.message));
    }, (r) {
      emit(state.copyWith(
          movieDetail: r, movieDetailsState: RequestState.loaded));
    });
  }
}
