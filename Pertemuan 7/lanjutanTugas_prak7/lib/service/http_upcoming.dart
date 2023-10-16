// ignore_for_file: avoid_print, unnecessary_cast

import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_rest_api/models/movie_upcoming.dart';

class HttpUpcoming {
  final String apiKey = '17c29705640b1f76a89ecc60ac04a98b';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=';

  Future<List<Upcoming>?> getUpcomingMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Success");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List<Upcoming> moviesUpcoming = List<Upcoming>.from(
          moviesMap.map((i) => Upcoming.fromJson(i) as Upcoming));
      return moviesUpcoming;
    } else {
      print("Failed");
      return null;
    }
  }
}
