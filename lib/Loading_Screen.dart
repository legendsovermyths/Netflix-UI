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
    var listImages= await model.getTrending();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomePage(data: data,listImages: listImages,);
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
    return Container();
  }
}
