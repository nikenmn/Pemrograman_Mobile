// ignore_for_file: unnecessary_null_comparison, prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:movie_rest_api/models/movie_toprated.dart';

class TopRatedDetail extends StatelessWidget {
  final TopRated movie;
  final String imgPath = 'https://image.tmdb.org/t/p/w500/';

  TopRatedDetail(this.movie);

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
        backgroundColor: Colors.black,
        title: Text(movie.title),
      ),
      backgroundColor: Colors.black,
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
                color: Colors.black,
                margin: EdgeInsets.symmetric(horizontal: 16),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Center(
                    child: Column(
                      children: [
                        Text(
                          movie.overview,
                          style: TextStyle(fontSize: 16, color: Colors.white),
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
                                  primary: Color(0xFFE50914),
                                ),
                                child: Text(
                                  'Trailer',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.share,
                                color: Color(0xFFE50914),
                                size: 30,
                              ),
                              onPressed: () {
                                // tidak ada action
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.download,
                                color: Color(0xFFE50914),
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
