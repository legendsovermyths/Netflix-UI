import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContentScroll extends StatelessWidget {
  final List<String> images;
  final String title;
  final double imageHeight;
  final double imageWidth;
  ContentScroll({this.title,this.imageHeight,this.images,this.imageWidth});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              title,
              style:TextStyle(fontSize: 20,fontWeight:  FontWeight.w600)
            ),
            GestureDetector(
              onTap: ()=>print('View $title'),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 30,
              ),
            )
          ],),

        ),
        Container(
          height: imageWidth,
          child: ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: 30),
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            itemBuilder: (BuildContext context, int index){
              return;
            },
          ),
        )
      ],
    );
  }
}
