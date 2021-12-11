import 'package:blogapp/schduleNotification/themes.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'constants.dart';

import 'dart:convert';

import 'package:blogapp/Pages/baby%20_sitter.dart';
import 'package:blogapp/Pages/doctor.dart';
import 'package:blogapp/Pages/gallary.dart';
import 'package:blogapp/common/custom_app_bar.dart';
import 'package:blogapp/group.dart';
import 'package:blogapp/grouth/homepageNew.dart';
import 'package:blogapp/schduleNotification/homeSchdule.dart';
import 'package:blogapp/utils/strings.dart';
import 'package:blogapp/utils/text_styles.dart';
import 'package:blogapp/vaccine/vaccine.dart';
import 'package:blogapp/videos/home_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../age.dart';

class MyHomePage extends StatefulWidget {
  final String birthdat;
  final String babyname;
  final String username;

  const MyHomePage({Key key, this.birthdat, this.babyname, this.username})
      : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final CategoriesScroller categoriesScroller = CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  DateTime _selecteddate = DateTime.now();

  List<Widget> itemsData = [];

  void getPostsData() {
    Container(
        alignment: Alignment.topCenter,
        height: 500,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
            color: Colors.orangeAccent),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          height: 100,
                          width: 100,
                          // padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.brown[100],
                          ),

                          child: Image.asset(
                            "assets/babymo.jpg",
                            height: 100,
                            width: 100,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          height: 75,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.brown[100],
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.topLeft,
                          height: 50,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Text(
                  "mai",
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
            ]));
  }

  @override
  void initState() {
    super.initState();
    getPostsData();

    /* controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });*/
  }

  getData() async {
    var url = Uri.parse("http://192.168.232.2/Hi_Baby/getdevelopment.php");
    var map = new Map<String, dynamic>();
    var respons = await http.post(url, body: map);
    var list = json.decode(respons.body);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    String birthdat = widget.birthdat;
    String babyname = widget.babyname;
    String username = widget.username;

    var dt = DateFormat.yMd().parse(birthdat);
    String vaccin =
        "${AgeCalculator.age(dt, today: DateTime.now()).years.toString()}|${AgeCalculator.age(dt, today: DateTime.now()).months.toString()}";
    // DateTime dt = DateTime.parse(birthdat + " 00:00:00.000");
    // DateFormat.yMd().format(dt);
    print(dt);
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 70, // Set this height

          backgroundColor: Colors.blue.shade400,
          title: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "   Baby $babyname",
                style: TextStyle(fontSize: 20),
                children: <TextSpan>[
                  TextSpan(
                    text:
                        "   \n   ${AgeCalculator.age(dt, today: DateTime.now()).years.toString()} years |${AgeCalculator.age(dt, today: DateTime.now()).months.toString()} Months | ${AgeCalculator.age(dt, today: DateTime.now()).days.toString()} Days",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ]),
          ),
        ),
        drawer: Drawer(),
        body: Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat.yMMMMd().format(DateTime.now()),
                    style: subHeadingstyle,
                  ),
                  Text(
                    "Today",
                    style: Headingstyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 200),
                opacity: closeTopContainer ? 0 : 1,
                child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: size.width,
                    alignment: Alignment.topCenter,
                    height: closeTopContainer ? 0 : categoryHeight,
                    child: categoriesScroller),
              ),
              Expanded(
                  child: ListView.builder(
                      controller: controller,
                      itemCount: itemsData.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        double scale = 1.0;
                        if (topContainer > 0.5) {
                          scale = index + 0.5 - topContainer;
                          if (scale < 0) {
                            scale = 0;
                          } else if (scale > 1) {
                            scale = 1;
                          }
                        }
                        return Opacity(
                          opacity: scale,
                          child: Transform(
                            transform: Matrix4.identity()..scale(scale, scale),
                            alignment: Alignment.bottomCenter,
                            child: Align(
                                heightFactor: 0.7,
                                alignment: Alignment.topCenter,
                                child: itemsData[index]),
                          ),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesScroller extends StatefulWidget {
  //const CategoriesScroller();
  final String username;

  const CategoriesScroller({Key key, this.username}) : super(key: key);
  @override
  State<CategoriesScroller> createState() => _CategoriesScrollerState();
}

class _CategoriesScrollerState extends State<CategoriesScroller> {
  @override
  Widget build(BuildContext context) {
    String username = widget.username;

    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        // margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          // padding: const EdgeInsets.symmetric(horizontal: 16.0),

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.brown[100],
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => doctor(),
                          ),
                        );
                      },
                      child: Image.asset(
                        "assets/doctor.png",
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    Strings.bear,
                    style: TextStyles.body2TextStyle,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.brown[100],
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  homeschdule(username: username),
                            ),
                          );
                        },
                        child: Image.asset(
                          "assets/todolist.png",
                          height: 50,
                          width: 50,
                        ),
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    Strings.lion,
                    style: TextStyles.body2TextStyle,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.brown[100],
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => group(),
                            ),
                          );
                        },
                        child: Image.asset(
                          "assets/team.png",
                          height: 50,
                          width: 50,
                        ),
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    Strings.reptiles,
                    style: TextStyles.body2TextStyle,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.brown[100],
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Baby_sitter(),
                            ),
                          );
                        },
                        child: Image.asset(
                          "assets/maternity.png",
                          height: 50,
                          width: 50,
                        ),
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    Strings.pets,
                    style: TextStyles.body2TextStyle,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.brown[100],
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyDashboard(),
                            ),
                          );
                        },
                        child: Image.asset(
                          "assets/vaccines.png",
                          height: 50,
                          width: 50,
                        ),
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    Strings.Vaccines,
                    style: TextStyles.body2TextStyle,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.brown[100],
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                          );
                        },
                        child: Image.asset(
                          "assets/video.png",
                          height: 50,
                          width: 50,
                        ),
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    Strings.videos,
                    style: TextStyles.body2TextStyle,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.brown[100],
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyDashboard(),
                            ),
                          );
                        },
                        child: Image.asset(
                          "assets/baby.png",
                          height: 50,
                          width: 50,
                        ),
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    Strings.baby,
                    style: TextStyles.body2TextStyle,
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.brown[100],
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => doctor(),
                            ),
                          );
                        },
                        child: Image.asset(
                          "assets/online.png",
                          height: 50,
                          width: 50,
                        ),
                      )),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    Strings.article,
                    style: TextStyles.body2TextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
