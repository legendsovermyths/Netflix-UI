import 'package:flutter/material.dart';
import 'package:netflix_ui/SearchScreen.dart';
import 'package:netflix_ui/MovieScreen.dart';


class SearchList extends StatelessWidget {

  const SearchList({
    @required this.moviesData,
    @required this.widget,
  });

  final moviesData;
  final SearchScreen widget;

  @override
  Widget build(BuildContext context) {
    var tag=0;
    return Container(
        child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 15),
            scrollDirection: Axis.vertical,
            itemCount: moviesData["results"].length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(0.0, 4.0),
                                blurRadius: 6.0,
                              )
                            ]),
                        child: Hero(
                          tag: moviesData["results"][index]
                          ['backdrop_path'] !=
                              null
                              ? moviesData["results"][index]
                          ['backdrop_path']
                              : tag++,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          MovieScreen(
                                            movie:
                                            moviesData['results']
                                            [index],
                                            genres: widget.genres,
                                          )),
                                );
                              },
                              child: Image(
                                image: NetworkImage(
                                    "https://image.tmdb.org/t/p/original" +
                                        (moviesData["results"][index]
                                        ['poster_path'] !=
                                            null
                                            ? moviesData["results"]
                                        [index]['poster_path']
                                            : "")),
                                height: 150,
                                width: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Flexible(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              moviesData["results"][index]['title'] !=
                                  null
                                  ? moviesData["results"][index]
                              ['title']
                                  .toUpperCase()
                                  : moviesData["results"][index]
                              ['name']
                                  .toUpperCase(),
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              "Rating: " +
                                  moviesData["results"][index]
                                  ['vote_average']
                                      .toString(),
                              style: TextStyle(
                                wordSpacing: 4,
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 0.565,
                      width: double.infinity,
                      color: Colors.grey,
                    ),
                  ),
                ],
              );
            }));
  }
}