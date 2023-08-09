import 'package:movies_app/movie/domain/entities/recommentation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel(super.backdropPath, super.id);

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        json["backdrop_path"],
        json["id"],
      );
}
