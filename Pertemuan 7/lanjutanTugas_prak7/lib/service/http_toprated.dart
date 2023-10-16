// ignore_for_file: unnecessary_cast, avoid_print

import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_rest_api/models/movie_toprated.dart';

class HttpTopRated {
  final String apiKey = '17c29705640b1f76a89ecc60ac04a98b';
  final String baseUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=';

  Future<List<TopRated>?> getTopRatedMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Success");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List<TopRated> moviesTopRated = List<TopRated>.from(
          moviesMap.map((i) => TopRated.fromJson(i) as TopRated));
      return moviesTopRated;
    } else {
      print("Failed");
      return null;
    }
  }
}
