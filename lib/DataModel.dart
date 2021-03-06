import 'package:netflix_ui/Networking.dart';
import 'dart:math';
const String API="c63a8d1f540c00995d091ef83f5fb623";
var random=Random();
var page=random.nextInt(3)+1;
var page2=random.nextInt(3)+1;
class Model{
  final String query;
  Model({this.query});
  Future<dynamic> getNetflixOriginals () async{
    String url="https://api.themoviedb.org/3/discover/tv?api_key=$API&with_networks=213&page=$page";
    Networking networking2=Networking(url: url);
    var data=await networking2.getdata();
    return data;
  }
  Future<dynamic> getTrending () async{
    String url="https://api.themoviedb.org/3/trending/all/week?api_key=$API&language=en-US&page=1";
    Networking networking2=Networking(url: url);
    var data=await networking2.getdata();
    return data;
  }
  Future<dynamic> getTopRated () async{
    String url="https://api.themoviedb.org/3/movie/top_rated?api_key=$API&language=en-US";
    Networking networking2=Networking(url: url);
    var data=await networking2.getdata();
    return data;
  }
  Future<dynamic> getActionMovies () async{
    String url="https://api.themoviedb.org/3/discover/movie?api_key=$API&with_genres=28";
    Networking networking2=Networking(url: url);
    var data=await networking2.getdata();
    return data;
  }
  Future<dynamic> getComedyMovies () async{
    String url="https://api.themoviedb.org/3/discover/movie?api_key=$API&with_genres=35";
    Networking networking2=Networking(url: url);
    var data=await networking2.getdata();
    return data;
  }
  Future<dynamic> getHorrorMovies () async{
    String url="https://api.themoviedb.org/3/discover/movie?api_key=$API&with_genres=27";
    Networking networking2=Networking(url: url);
    var data=await networking2.getdata();
    return data;
  }
  Future<dynamic> getRomanceMovies () async{
    String url="https://api.themoviedb.org/3/discover/movie?api_key=$API&with_genres=10749";
    Networking networking2=Networking(url: url);
    var data=await networking2.getdata();
    return data;
  }
  Future<dynamic> getDocumentaries () async{
    String url="https://api.themoviedb.org/3/discover/movie?api_key=$API&with_genres=99";
    Networking networking2=Networking(url: url);
    var data=await networking2.getdata();
    return data;
  }
  Future<dynamic> getGenres () async {
    String url = "https://api.themoviedb.org/3/genre/tv/list?api_key=c63a8d1f540c00995d091ef83f5fb623&language=en-US&with_networks=213&page=1";
    Networking networking2 = Networking(url: url);
    var data = await networking2.getdata();
    return data;
  }
  Future<dynamic> getSearchedMovies () async{
    String url="https://api.themoviedb.org/3/search/movie?api_key=$API&language=en-US&page=1&include_adult=false&query=$query";
    Networking networking2=Networking(url: url);
    var data=await networking2.getdata();
    return data;
  }
  Future<dynamic> getSearchedTV () async{
    String url="https://api.themoviedb.org/3/search/tv?api_key=$API&language=en-US&page=1&include_adult=false&query=$query";
    Networking networking2=Networking(url: url);
    var data=await networking2.getdata();
    return data;
  }
  Future<dynamic> getPopularMovies () async{
    String url="https://api.themoviedb.org/3/movie/popular?api_key=$API&language=en-US&page=1";
    Networking networking2=Networking(url: url);
    var data=await networking2.getdata();
    return data;
  }
  Future<dynamic> getPopularTV () async{
    String url="https://api.themoviedb.org/3/tv/popular?api_key=$API&language=en-US&page=1";
    Networking networking2=Networking(url: url);
    var data=await networking2.getdata();
    return data;
  }


}
