import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CircularClipper.dart';

class MovieScreen extends StatefulWidget {
  final movie;
  MovieScreen({this.movie});
  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  String url = "https://image.tmdb.org/t/p/original/";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child: Hero(
                  tag: widget.movie["backdrop_path"],
                  child: ClipShadowPath(
                      clipper: CircularClipper(),
                      shadow: Shadow(blurRadius: 20.0),
                      child: Image(
                        height: 350,
                        width: double.infinity,
                        image:
                            NetworkImage(url + widget.movie['backdrop_path']),
                        fit: BoxFit.cover,
                      )),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
