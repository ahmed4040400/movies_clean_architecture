import 'package:equatable/equatable.dart';
import 'package:movies_app/movie/domain/entities/generes.dart';

class MovieDetail extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final List<Genres> genres;
  final String overview;
  final int runtime;
  final double voteAverage;
  final String releaseDate;

  const MovieDetail({
    required this.id,
    required this.title,
    required this.backdropPath,
    required this.genres,
    required this.overview,
    required this.runtime,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        backdropPath,
        genres,
        overview,
        runtime,
        voteAverage,
        releaseDate,
      ];
}
