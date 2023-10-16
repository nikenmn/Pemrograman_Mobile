// ignore_for_file: avoid_print, prefer_const_constructors, sized_box_for_whitespace, prefer_interpolation_to_compose_strings, sort_child_properties_last, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:movie_rest_api/models/movie.dart';
import 'package:movie_rest_api/models/movie_upcoming.dart';
import 'package:movie_rest_api/models/movie_toprated.dart';
import 'package:movie_rest_api/models/nowplaying.dart';

import 'package:movie_rest_api/service/http_service.dart';
import 'package:movie_rest_api/service/http_upcoming.dart';
import 'package:movie_rest_api/service/http_toprated.dart';
import 'package:movie_rest_api/service/http_nowplaying.dart';

import 'package:movie_rest_api/pages/movie_detail.dart';
import 'package:movie_rest_api/pages/upcoming_detail.dart';
import 'package:movie_rest_api/pages/toprated_detail.dart';
import 'package:movie_rest_api/pages/nowplaying_detail.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  late HttpService service;
  late HttpUpcoming service2;
  late HttpTopRated service3;
  late HttpNowPlaying service4;
  bool isLoading = true;

  List<Movie> popularMovies = [];
  List<Upcoming> upcomingMovies = [];
  List<TopRated> topRatedMovies = [];
  List<NowPlaying> nowPlayingMovies = [];

  @override
  void initState() {
    service = HttpService();
    service2 = HttpUpcoming();
    service3 = HttpTopRated();
    service4 = HttpNowPlaying();
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      await fetchPopularMovies();
      await fetchUpcomingMovies();
      await fetchTopRatedMovies();
      await fetchNowPlayingMovies();

      setState(() {
        isLoading = false;
      });
    } catch (e) {
      print("Error: $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> fetchPopularMovies() async {
    final popularMoviesData = await service.getPopularMovies();
    if (popularMoviesData != null) {
      setState(() {
        popularMovies = popularMoviesData;
      });
    }
  }

  Future<void> fetchUpcomingMovies() async {
    final upcomingMoviesData = await service2.getUpcomingMovies();
    if (upcomingMoviesData != null) {
      setState(() {
        upcomingMovies = upcomingMoviesData;
      });
    }
  }

  Future<void> fetchTopRatedMovies() async {
    final getTopRatedMoviesData = await service3.getTopRatedMovies();
    if (getTopRatedMoviesData != null) {
      setState(() {
        topRatedMovies = getTopRatedMoviesData;
      });
    }
  }

  Future<void> fetchNowPlayingMovies() async {
    final getNowPlayingMoviesData = await service4.getNowPlayingMovies();
    if (getNowPlayingMoviesData != null) {
      setState(() {
        nowPlayingMovies = getNowPlayingMoviesData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 2, 39, 94),
          title: Row(
            children: [
              Image.asset(
                'image/disney.png',
                width: 50,
                height: 50,
              ),
              SizedBox(width: 8),
              // Text("Movie Categories"),
            ],
          )),
      backgroundColor: Color(0xFFEFEFF2),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              scrollDirection: Axis.vertical,
              children: [
                buildCategory("- Film Terpopuler -", popularMovies),
                buildCategory2("- Film Akan Tayang -", upcomingMovies),
                buildCategory3("- Film Rate Tertinggi -", topRatedMovies),
                buildCategory4("- Sekarang Diputar -", nowPlayingMovies),
              ],
            ),
    );
  }

  Widget buildCategory(String categoryName, List<Movie> movies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            categoryName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              final marginLeft = index == 0 ? 8.0 : 0.0;
              return Padding(
                padding: EdgeInsets.only(left: marginLeft),
                child: buildMovieCard(movie),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildCategory2(String categoryName, List<Upcoming> moviesUpcoming) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            categoryName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: moviesUpcoming.length,
            itemBuilder: (context, index) {
              final movie2 = moviesUpcoming[index];
              final marginLeft = index == 0 ? 8.0 : 0.0;
              return Padding(
                padding: EdgeInsets.only(left: marginLeft),
                child: buildUpcomingCard(movie2),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildCategory3(String categoryName, List<TopRated> moviesTopRated) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            categoryName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: moviesTopRated.length,
            itemBuilder: (context, index) {
              final movie3 = moviesTopRated[index];
              final marginLeft = index == 0 ? 8.0 : 0.0;
              return Padding(
                padding: EdgeInsets.only(left: marginLeft),
                child: buildTopRatedCard(movie3),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildCategory4(
      String categoryName, List<NowPlaying> moviesNowPlaying) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            categoryName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          height: 270,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: moviesNowPlaying.length,
            itemBuilder: (context, index) {
              final movie4 = moviesNowPlaying[index];
              final marginLeft = index == 0 ? 8.0 : 0.0;
              return Padding(
                padding: EdgeInsets.only(left: marginLeft),
                child: buildNowPlayingCard(movie4),
              );
            },
          ),
        ),
      ],
    );
  }

  // WIDGET CARD
  Widget buildMovieCard(Movie movie) {
    final imgPath = 'https://image.tmdb.org/t/p/w500/' + movie.posterPath;

    return GestureDetector(
      onTap: () {
        MaterialPageRoute route =
            MaterialPageRoute(builder: (_) => MovieDetail(movie));
        Navigator.push(context, route);
      },
      child: Padding(
        padding: const EdgeInsets.all(0.5), // Padding untuk setiap card
        child: SizedBox(
          width: 150, // Lebar setiap card
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200, // Tinggi gambar
                  width: double.infinity, // Lebar gambar mengikuti card
                  child: Image.network(
                    imgPath,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 8.0, bottom: 5.0),
                  child: Text(
                    movie.title,
                    maxLines: 1, // Maksimal 2 baris judul
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          child: Image.asset(
                            'image/star.png',
                            width: 18,
                            height: 18,
                          ),
                          padding: EdgeInsets.only(bottom: 4.0),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '${movie.voteAverage}',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildUpcomingCard(Upcoming movie2) {
    final imgPath = 'https://image.tmdb.org/t/p/w500/' + movie2.posterPath;

    return GestureDetector(
      onTap: () {
        MaterialPageRoute route =
            MaterialPageRoute(builder: (_) => UpcomingDetail(movie2));
        Navigator.push(context, route);
      },
      child: Padding(
        padding: const EdgeInsets.all(0.5), // Padding untuk setiap card
        child: SizedBox(
          width: 150, // Lebar setiap card
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200, // Tinggi gambar
                  width: double.infinity, // Lebar gambar mengikuti card
                  child: Image.network(
                    imgPath,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 8.0, bottom: 5.0),
                  child: Text(
                    movie2.title,
                    maxLines: 1, // Maksimal 2 baris judul
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          child: Image.asset(
                            'image/star.png',
                            width: 18,
                            height: 18,
                          ),
                          padding: EdgeInsets.only(bottom: 4.0),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '${movie2.voteAverage}',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTopRatedCard(TopRated movie3) {
    final imgPath = 'https://image.tmdb.org/t/p/w500/' + movie3.posterPath;

    return GestureDetector(
      onTap: () {
        MaterialPageRoute route =
            MaterialPageRoute(builder: (_) => TopRatedDetail(movie3));
        Navigator.push(context, route);
      },
      child: Padding(
        padding: const EdgeInsets.all(0.5), // Padding untuk setiap card
        child: SizedBox(
          width: 150, // Lebar setiap card
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200, // Tinggi gambar
                  width: double.infinity, // Lebar gambar mengikuti card
                  child: Image.network(
                    imgPath,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 8.0, bottom: 5.0),
                  child: Text(
                    movie3.title,
                    maxLines: 1, // Maksimal 2 baris judul
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          child: Image.asset(
                            'image/star.png',
                            width: 18,
                            height: 18,
                          ),
                          padding: EdgeInsets.only(bottom: 4.0),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '${movie3.voteAverage}',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNowPlayingCard(NowPlaying movie4) {
    final imgPath = 'https://image.tmdb.org/t/p/w500/' + movie4.posterPath;

    return GestureDetector(
      onTap: () {
        MaterialPageRoute route =
            MaterialPageRoute(builder: (_) => NowPlayingDetail(movie4));
        Navigator.push(context, route);
      },
      child: Padding(
        padding: const EdgeInsets.all(0.5), // Padding untuk setiap card
        child: SizedBox(
          width: 150, // Lebar setiap card
          child: Card(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 200, // Tinggi gambar
                  width: double.infinity, // Lebar gambar mengikuti card
                  child: Image.network(
                    imgPath,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, top: 8.0, bottom: 5.0),
                  child: Text(
                    movie4.title,
                    maxLines: 1, // Maksimal 2 baris judul
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          child: Image.asset(
                            'image/star.png',
                            width: 18,
                            height: 18,
                          ),
                          padding: EdgeInsets.only(bottom: 4.0),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '${movie4.voteAverage}',
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
