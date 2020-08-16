import 'package:netflix_ui/Networking.dart';

const String API="c63a8d1f540c00995d091ef83f5fb623";
class Model{
  Future<dynamic> getNetflixOriginals () async{
    String url="https://api.themoviedb.org/3/trending/all/week?api_key=$API&language=en-US";
    Networking networking2=Networking(url: url);
    var data=await networking2.getdata();
    return data;
  }
}
