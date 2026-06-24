import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String backdropPath;
  final double voteAverage;
  final List<int> genreIds;
  final String overview;
  final String releaseDate;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.backdropPath,
    required this.voteAverage,
    required this.genreIds,
    required this.releaseDate,
  });
  @override
  List<Object?> get props => [
    id,
    title,
    overview,
    backdropPath,
    voteAverage,
    genreIds,
    releaseDate,
  ];
}
