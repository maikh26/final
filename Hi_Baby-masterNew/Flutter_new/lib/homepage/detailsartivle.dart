import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'circular_clipper.dart';
import 'content_scroll.dart';
import 'news_en.dart';
//import '../models/models.dart';
//import '../widgets/widgets.dart';

class NewsScreen1 extends StatefulWidget {
  final String des;
  final String title;
  final String image;
  final String id;
  final String counter;

  NewsScreen1({this.des, this.title, this.image, this.id, this.counter});

  @override
  _NewsScreen1State createState() => _NewsScreen1State();
}

class _NewsScreen1State extends State<NewsScreen1> {
  bool isPlaying = false;
  bool fav = false;

  FlutterTts _flutterTts = FlutterTts();

  Future<String> updateTask(String id, String counter) async {
    var ROOT = Uri.parse("http://192.168.232.2/Hi_Baby/updatefav.php");
    print("mai");

    try {
      var map = new Map<String, dynamic>();
      map["id"] = id;
      map["counter"] = counter;
      final response = await http.post(ROOT, body: map);
      print("updatTask >> Response:: ${response.body}");
      return response.body;
    } catch (e) {
      return 'error';
    }
  }

  @override
  void initState() {
    super.initState();

    _flutterTts.setStartHandler(() {
      setState(() {
        isPlaying = true;
      });
    });

    _flutterTts.setCompletionHandler(() {
      setState(() {
        isPlaying = false;
      });
    });

    _flutterTts.setErrorHandler((err) {
      setState(() {
        print("TTS error occurred: " + err);
        isPlaying = false;
      });
    });
  }

  //*********************************** iOS & Android device TTS setup**********
  void speechSettingsAndroid() {
    _flutterTts.setLanguage("en-US");
    //_flutterTts.setLanguage("bn-IN");
    //_flutterTts.setLanguage("bn-BD");
    _flutterTts.setPitch(1.0); //max is 2.0
    _flutterTts.setSpeechRate(0.85); //max is 1.0
    _flutterTts.setVolume(1.0); //max is 1.0
  }

  void speechSettingsiOS() {
    _flutterTts.setLanguage("en-US");
    _flutterTts.setPitch(1.0); //max is 2.0
    _flutterTts.setSpeechRate(0.5); //max is 1.0
    _flutterTts.setVolume(1.0); //max is 1.0
  }

  Future _speak(String text) async {
    if (text != null && text.isNotEmpty) {
      var result = await _flutterTts.speak(text);
      if (result == 1)
        setState(() {
          isPlaying = true;
        });
    }
  }

  Future _stop() async {
    var result = await _flutterTts.stop();
    if (result == 1)
      setState(() {
        isPlaying = false;
      });
  }

  @override
  Widget build(BuildContext context) {
    // String description = widget.news.description;
    String description = widget.des;
    String title = widget.title;
    String image = widget.image;
    String id = widget.id;
    String counter = widget.counter;

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                child: Hero(
                  tag: image,
                  child: ClipShadowPath(
                    clipper: CircularClipper(),
                    shadow: Shadow(blurRadius: 20.0),
                    child: Image(
                      height: 350.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      image: AssetImage(image),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    padding: EdgeInsets.only(left: 30.0),
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                    iconSize: 30.0,
                    color: Theme.of(context).buttonColor,
                  ),
                  IconButton(
                    padding: EdgeInsets.only(left: 30.0),
                    onPressed: () => {
                      setState(() {
                        //updateTask(id, counter+'1');
                        print('Add to Favorites');
                        int coun = int.parse(counter.toString());
                        coun = coun + 1;
                        String count = coun.toString();

                        updateTask(id, count);
                        print(count);
                        fav = false;
                      })
                    },
                    icon: fav
                        ? Icon(Icons.favorite)
                        : Icon(Icons.favorite_border),
                    iconSize: 30.0,
                    color: Theme.of(context).buttonColor,
                  ),
                ],
              ),
              //**************************** Button action *********************
              Positioned.fill(
                bottom: 10.0,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RawMaterialButton(
                    padding: EdgeInsets.all(10.0),
                    elevation: 12.0,
                    onPressed: () {
                      setState(
                        () {
                          speechSettingsiOS();
                          //speechSettingsAndroid();
                          isPlaying ? _stop() : _speak(description);
                        },
                      );
                    },
                    shape: CircleBorder(),
                    fillColor: Colors.white,
                    child: isPlaying
                        ? Icon(
                            Icons.stop,
                            size: 60,
                            color: Colors.green,
                          )
                        : Icon(
                            Icons.play_arrow,
                            size: 60,
                            color: Colors.red,
                          ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  title.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.0),

                //************************** Description ***********************
                Container(
                  height: 300.0,
                  child: SingleChildScrollView(
                    child: Text(
                      description,
                      style: TextStyle(fontSize: 15.0),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
