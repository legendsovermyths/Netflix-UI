import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController=PageController(initialPage: 1,viewportFraction:0.8);
  }
  _movieSelector(int index){
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget){
        double value=1;
        if(_pageController.position.haveDimensions){
          value=_pageController.page -index;
          value=(1-value.abs()*0.3+0.6).clamp(0,1);
        }
        return Center(child: SizedBox(height: Curves.easeInOut.transform(value)*270.0,
        width: Curves.easeInOut.transform(value)*400,
        child: widget,),);
      },
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              decoration:BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0.0,0.4),
                    blurRadius:10.0,

                  )
                ],
              ),
              child: Center(
                child:Hero(
                  tag: movies[index].imageurl,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image:AssetImage(movies[index].imageUrl),
                      height:220.0,
                      fit:BoxFit.cover
                    ),
                  ),
                )
              ),
            ),
          ),
          Positioned(
            left: 30.0,
            bottom: 40.0,
            child: Container(
              width: 250.0,
              child: Text(
                movies[index].title.toUpperCase(),
                style: TextStyle(color: Colors.white, fontSize: 20.0 ,fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Image(
          alignment: Alignment.center,
          height: 60,

          image: AssetImage('images/netflix_logo.png'),
        ),
        leading: IconButton(
          padding: EdgeInsets.only(left: 30.0),
          onPressed: (){},
          icon: Icon(Icons.menu),
          color: Colors.black,
        ),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 30.0),
            onPressed: (){},
            icon:Icon(Icons.search),
             color: Colors.black,
          )
        ],
      ),
    body: ListView(
      children: <Widget>[
        Container(
          height: 280,
          width: double.infinity,
          child: PageView.builder(
            controller:_pageController,
            itemCount: movies.length,
            itemBuilder: (BuildContext context, int index){
              return _movieSelector(index);
            },
          ),
        )
      ],
    ),
    );
  }
}
