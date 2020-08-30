import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CircularClipper.dart';

class MovieScreen extends StatefulWidget {
  final movie;
  final genres;

  MovieScreen({this.movie, this.genres});

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  List<String> genres = [];
  String url = "https://image.tmdb.org/t/p/original/";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < 16; i++) {

      var genre1 = widget.genres['genres'][i]["id"];
      for (var j = 0; j < widget.movie["genre_ids"].length; j++) {
        var genre2 = widget.movie["genre_ids"][j];
        if (genre1 == genre2) {
          genres.add(widget.genres['genres'][i]["name"]);
        }
      }


    }
  }

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
                        height: 400,
                        width: double.infinity,
                        image:
                            NetworkImage(url + widget.movie['backdrop_path']),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left: 30.0),
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                    color: Colors.black,
                  ),

                  IconButton(
                    padding: EdgeInsets.only(left: 30.0),
                    onPressed: () => print("add to favourites"),
                    icon: Icon(Icons.favorite_border),
                    color: Colors.black,
                  ),
                ],
              ),
              Positioned.fill(
                bottom: 10.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RawMaterialButton(
                    padding: EdgeInsets.all(10.0),
                    elevation: 12,
                    onPressed: () => print("Play"),
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                    child: Icon(
                      Icons.play_arrow,
                      size: 60,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 20.0,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                  iconSize: 40.0,
                  color: Colors.black,
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 25.0,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share),
                  iconSize: 35.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  widget.movie['title'] != null
                      ? widget.movie['title'].toUpperCase()
                      : widget.movie['name'].toUpperCase(),
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: (FontWeight.bold)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  genres.toString().substring(1, genres.toString().length - 1),
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16.0,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "Popularity",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          widget.movie["popularity"].toInt().toString(),
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "Rating",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          widget.movie["vote_average"].toString(),
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w600),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          "Origin",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(
                          height: 2.0,
                        ),
                        Text(
                          widget.movie["origin_country"].toString().substring(1,3),
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.w600),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: 25.0,),
                Container(
                  height: 120.0,
                  child: SingleChildScrollView(
                    child: Text(
                      widget.movie['overview'],
                      style:TextStyle(
                        fontSize: 15,
                        color: Colors.black54,

                      )
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
