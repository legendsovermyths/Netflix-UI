import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var obj = {
    "popularity": 45.525,
    "vote_count": 19933,
    "video": false,
    "poster_path": "/k1lICEYRpJeFRIRfjxYwmpO9LTu.jpg",
    "id": 550,
    "adult": false,
    "backdrop_path": "/7XEtHQoy1hwa8XWaOkSv3rlteea.jpg",
    "original_language": "en",
    "original_title": "Fight Club",
    "title": "Fight Club",
    "vote_average": 8.4,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: TextField(
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.blueGrey),
              focusColor: Colors.white,
              border: OutlineInputBorder(borderSide: BorderSide.none),
            ),
            onEditingComplete: () {
              print("Hi Anirudh!");
            },
            keyboardAppearance: Brightness.light,
          ),
        ),
        body: Container(

            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 15),
                scrollDirection: Axis.vertical,
                itemCount: 7,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: <Widget>[
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                offset: Offset(0.0, 4.0),
                                blurRadius: 6.0,
                              )
                            ]),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image(
                            image: NetworkImage(
                                "https://image.tmdb.org/t/p/original/k1lICEYRpJeFRIRfjxYwmpO9LTu.jpg"),
                            height: 200,
                            width: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Column(
                        children: <Widget>[
                          Text("Fight Club"
                              )
                        ],
                      )
                    ],
                  );
                })));
  }
}
