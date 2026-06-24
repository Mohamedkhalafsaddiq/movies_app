import 'package:movies_app/movies/domain/entites/recomendation.dart';

class RecommendationModel extends Recomendation {
  const RecommendationModel({super.backdropPath, required super.id});

  factory RecommendationModel.fromJson(
    Map<String, dynamic> json,
  ) => RecommendationModel(
    id: json['id'],
    backdropPath:
        json['backdrop_path'] ??
        'https://cdn.shopify.com/s/files/1/0909/8077/8315/collections/James_Bond_no_time_to_die_original_movie_poster_framed-min.jpg?v=1743170006',
  );
}
