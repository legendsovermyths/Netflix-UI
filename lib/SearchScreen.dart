import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_ui/SearchList.dart';
import 'DataModel.dart';

class SearchScreen extends StatefulWidget {
  final TV;
  final movies;
  final genres;
  SearchScreen({this.genres, this.movies,this.TV});
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final myController = TextEditingController();
  String query;
  var moviesData;
  var tvData;
  void updateUI(data,data_2) {
    setState(() {
      moviesData = data;
      tvData = data_2;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.movies,widget.TV);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.black,
              onPressed: (){
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () async{
                  if(myController.text!="") {
                    Model model = Model(query: myController.text);
                    var data = await model.getSearchedMovies();
                    var data_2 = await model.getSearchedTV();
                    print(data);
                    updateUI(data, data_2);
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  }
                  else{
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    if (!currentFocus.hasPrimaryFocus) {
                      currentFocus.unfocus();
                    }
                  }

                },
                color: Colors.black,
              )
            ],
            centerTitle: false,
            elevation: 0,
            backgroundColor: Colors.white,
            title: TextField(
              controller: myController,
              decoration: InputDecoration(
                fillColor: Colors.transparent,
                filled: true,
                hintText: "Search",
                hintStyle: TextStyle(color: Colors.blueGrey),
                focusColor: Colors.white,
                border: OutlineInputBorder(borderSide: BorderSide.none),
              ),
              onChanged: (value) {
                value = value.replaceAll(new RegExp(r' '), '/');
                query = value;
                print(query);
              },
              onEditingComplete: () async {
                Model model = Model(query: query);
                var data = await model.getSearchedMovies();
                var data_2 = await model.getSearchedTV();
                print(data);
                updateUI(data,data_2);
                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
              keyboardAppearance: Brightness.light,
            ),
            bottom: TabBar(
              indicatorColor: Colors.redAccent,
              tabs: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      "Movies",
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "TV/Web Series",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              SearchList(moviesData: moviesData, widget: widget),
              SearchList(moviesData: tvData,widget: widget,),
            ],
          )),
    );
  }
}


