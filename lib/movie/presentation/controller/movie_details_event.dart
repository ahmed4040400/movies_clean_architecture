part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent extends Equatable {}

class GetMovieDetailsEvent extends MovieDetailsEvent {
  final int id;

  GetMovieDetailsEvent(this.id);

  @override
  List<Object?> get props => [id];
}

class GetMovieRecommendationEvent extends MovieDetailsEvent {
  final int id;

  GetMovieRecommendationEvent(this.id);

  @override
  List<Object?> get props => [id];
}
