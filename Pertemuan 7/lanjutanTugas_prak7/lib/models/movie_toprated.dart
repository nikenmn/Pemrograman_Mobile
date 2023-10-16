class TopRated {
  final int id;
  final String title;
  final double voteAverage;
  final String overview;
  final String posterPath;

  TopRated({
    required this.id,
    required this.title,
    required this.voteAverage,
    required this.overview,
    required this.posterPath,
  });

  factory TopRated.fromJson(Map<String, dynamic> parsedJson) {
    return TopRated(
      id: parsedJson['id'] as int,
      title: parsedJson['title'] as String,
      voteAverage: (parsedJson['vote_average'] as num).toDouble(),
      overview: parsedJson['overview'] as String,
      posterPath: parsedJson['poster_path'] as String,
    );
  }
}
