// ignore_for_file: unnecessary_cast, avoid_print

import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_rest_api/models/nowplaying.dart';

class HttpNowPlaying {
  final String apiKey = '17c29705640b1f76a89ecc60ac04a98b';
  final String baseUrl =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=';

  Future<List<NowPlaying>?> getNowPlayingMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Success");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List<NowPlaying> movies = List<NowPlaying>.from(
          moviesMap.map((i) => NowPlaying.fromJson(i) as NowPlaying));
      return movies;
    } else {
      print("Failed");
      return null;
    }
  }
}
