class Movie {
  final int id;
  final String title;
  final double voteAverage;
  final String overview;
  final String posterPath;

  Movie({
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.overview,
    required this.posterPath,
  });

  factory Movie.fromJson(Map<String, dynamic> parsedJson) {
    return Movie(
      id: parsedJson['id'] as int,
      title: parsedJson['title'] as String,
      voteAverage: (parsedJson['vote_average'] as num).toDouble(),
      overview: parsedJson['overview'] as String,
      posterPath: parsedJson['poster_path'] as String,
    );
  }
}
