// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors, prefer_const_constructors_in_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:movie_rest_api/models/movie.dart';

class MovieDetail extends StatelessWidget {
  final Movie movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  MovieDetail(this.movie);

  @override
  Widget build(BuildContext context) {
    String path;
    if (movie.posterPath != null) {
      path = imgPath + movie.posterPath;
    } else {
      path =
          'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';
    }
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Color.fromARGB(255, 2, 39, 94),
      ),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(16),
                height: height / 1.5,
                child: Image.network(path),
              ),
              Card(
                color: const Color.fromARGB(255, 255, 255, 255),
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          movie.overview,
                          style: TextStyle(
                              fontSize: 16,
                              color: const Color.fromARGB(255, 0, 0, 0)),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 210,
                              height: 40,
                              margin: EdgeInsets.only(right: 10),
                              child: ElevatedButton(
                                onPressed: () {
                                  // tidak ada action
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 2, 39, 94),
                                ),
                                child: Text(
                                  'Trailer',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.share,
                                color: Color.fromARGB(255, 2, 39, 94),
                                size: 30,
                              ),
                              onPressed: () {
                                // tidak ada action
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.download,
                                color: Color.fromARGB(255, 2, 39, 94),
                                size: 30,
                              ),
                              onPressed: () {
                                // tidak ada action
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
