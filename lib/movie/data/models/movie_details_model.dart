import 'package:movies_app/movie/domain/entities/movie_detail.dart';

import '../../domain/entities/generes.dart';
import 'genres_model.dart';

class MovieDetailsModel extends MovieDetail {
  const MovieDetailsModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
    required super.genres,
    required super.runtime,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        id: json["id"],
        title: json["title"],
        backdropPath: json["backdrop_path"],
        genres: List<Genres>.from(
          json["genres"].map(
            (e) => GenresModel.fromJson(e),
          ),
        ),
        overview: json["overview"],
        voteAverage: json["vote_average"].toDouble(),
        releaseDate: json["release_date"],
        runtime: json["runtime"],
      );
}
