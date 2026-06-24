import 'package:movies_app/movies/domain/entites/genres.dart';

class GenresModel extends Genres {
  const GenresModel(super.id, super.name);

  factory GenresModel.fromJson(Map<String, dynamic> json) {
    return GenresModel(json['id'], json['name']);
  }
}
