import 'package:movies_app/movies/data/models/geners_model.dart';
import 'package:movies_app/movies/domain/entites/movie_datails.dart';

class MovieDatailsModel extends MovieDatails {
  const MovieDatailsModel({
    required super.backdropPath,
    required super.id,
    required super.overview,
    required super.releaseDate,
    required super.runtime,

    required super.title,
    required super.voteAverage,
    required super.genres,
  });

  factory MovieDatailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDatailsModel(
      backdropPath: json['backdrop_path'],
      id: json['id'],
      runtime: json['runtime'],
      overview: json['overview'],
      releaseDate: json['release_date'],
      title: json['title'],
      voteAverage: json['vote_average'].toDouble(),
      genres: List<GenresModel>.from(
        json['genres'].map((x) => GenresModel.fromJson(x)),
      )
    );
  }
}
