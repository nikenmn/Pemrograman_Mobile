class Upcoming {
  final int id;
  final String title;
  final double voteAverage;
  final String overview;
  final String posterPath;
  final String releaseDate;

  Upcoming({
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
  });

  factory Upcoming.fromJson(Map<String, dynamic> parsedJson) {
    return Upcoming(
      id: parsedJson['id'] as int,
      title: parsedJson['title'] as String,
      voteAverage: (parsedJson['vote_average'] as num).toDouble(),
      overview: parsedJson['overview'] as String,
      posterPath: parsedJson['poster_path'] as String,
      releaseDate: parsedJson['release_date'] as String,
    );
  }
}
