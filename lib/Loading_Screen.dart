import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:netflix_ui/DataModel.dart';
import 'package:netflix_ui/HomePage.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getData() async{
    Model model = Model();
    var data = await model.getNetflixOriginals();
    var listImages= await model.getRomanceMovies();
    var listImages2=await model.getTrending();
    var listMovies=await model.getTrending();
    var genres=await model.getGenres();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage(data: data,listImages: listImages,genres: genres,listImages2:listImages2,listMovies:listMovies);
    }));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
          alignment: Alignment.center,
          height: 110,
          image: AssetImage('images/netflix_logo.png'),
      ),
          SpinKitDualRing(
            size: 30,
            color: Colors.red,
          ),
          SizedBox(
            height: 400,
          ),
          Text(
            "Concept By Anirudh Singh"
          )
        ],
      ));
  }
}
