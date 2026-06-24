import 'package:movies_app/movies/domain/entites/movie.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.id,
    required super.title,
    required super.overview,
    required super.backdropPath,
    required super.voteAverage,
    required super.genreIds,
    required super.releaseDate,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['name'] ?? json['title'],
      overview: json['overview'],
      backdropPath: json['backdrop_path'],
      voteAverage: json['vote_average'].toDouble(),
      genreIds: List<int>.from(json['genre_ids'].map((x) => x)),
      releaseDate: json['release_date'] ?? '',
    );
  }
}
