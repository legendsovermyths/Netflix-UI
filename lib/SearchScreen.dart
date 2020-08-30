import 'package:flutter/material.dart';
import 'package:netflix_ui/MovieScreen.dart';
import 'DataModel.dart';

class SearchScreen extends StatefulWidget {
  final movies;
  final genres;
  SearchScreen({this.genres,this.movies});
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var tag=0;
  String query;
  var moviesData;
  void updateUI(data){
    setState(() {
      moviesData=data;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.movies);
  }
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
            onChanged: (value){
              value=value.replaceAll(new RegExp(r' '), '/');
              query=value;
              print(query);
            },
            onEditingComplete: () async{
              Model model=Model(query: query);
              var data=await model.getSearchedMovies();
              print(data);
              updateUI(data);
            },
            keyboardAppearance: Brightness.light,
          ),
        ),
        body: Container(
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
                              tag:moviesData["results"][index]['backdrop_path']!=null?moviesData["results"][index]['backdrop_path']:tag++,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MovieScreen(movie: moviesData['results'][index],genres: widget.genres,)),
                                    );
                                  },
                                  child: Image(
                                    image: NetworkImage(
                                        "https://image.tmdb.org/t/p/original"+(moviesData["results"][index]['poster_path']!=null?moviesData["results"][index]['poster_path']:"")),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                  moviesData["results"][index]['title'] != null
                  ? moviesData["results"][index]['title'].toUpperCase()
                      : moviesData["results"][index]['name'].toUpperCase(),
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
                                 "Rating: "+ moviesData["results"][index]['vote_average'].toString(),
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
                })));
  }
}
