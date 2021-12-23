import 'package:blogapp/homepage/detailsartivle.dart';
import 'package:flutter/material.dart';
//import '../models/models.dart';
//import '../screens/screens.dart';
import 'news_details.dart';
import 'news_en.dart';
import 'homepage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ContentScroll extends StatelessWidget {
  final List<String> imageUrl;
  final String title;
  final double imageHeight;
  final double imageWidth;

  ContentScroll({
    this.imageUrl,
    this.title,
    this.imageHeight,
    this.imageWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
             
            ],
          ),
        ),
        Container(
          height: imageHeight,
           // scrollDirection: Axis.horizontal,
          child: FutureBuilder(
           future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) print(snapshot.error);
              return ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
            scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int i) {

                  return GestureDetector(
                    onTap: () {
                      print("object");
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => NewsScreen1( 
                           des: snapshot.data[i]['des'],
                          title: snapshot.data[i]['title'],
                          image:snapshot.data[i]['image'],
                          id: snapshot.data[i]['id'],
                         counter: snapshot.data[i]['favcounter']
                          ),
                          ),
                        );
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 20.0,
                      ),
                       width:150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0.0, 4.0),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Image(
                                image: AssetImage(snapshot.data[i]['image']),
                                fit: BoxFit.cover,
                                //height:100,
                               // width:100,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                 
                                padding: EdgeInsets.all(9.0),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.black26, Colors.black],
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    if (title == "For You")
                                      (Text(
                                        snapshot.data[i]['title'],
                                        //"Test",
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                        ),
                                      ))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              );
            },
          ),
        ),
      ],
    );
  }
  getData() async {
    var url = Uri.parse("http://192.168.232.2/Hi_Baby/getarticle.php");
    var map = new Map<String, dynamic>();
    var respons = await http.post(url, body: map);
    var list = json.decode(respons.body);
    return list;
  }
}

class _newslist {}
