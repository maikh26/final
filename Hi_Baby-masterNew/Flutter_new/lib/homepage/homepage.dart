import 'package:blogapp/homepage/news_en.dart';
import 'package:flutter/material.dart';

import 'content_scroll.dart';
import 'devlist.dart';
import 'news_details.dart';
//import 'news_en.dart';
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
//import '../models/models.dart';
//import '../screens/screens.dart';
//import '../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  final String birthdat;
  final String babyname;
  final String username;

  const HomeScreen({Key key, this.birthdat, this.babyname, this.username})
      : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  var listnew = [];
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  var listdevee = [];
  getData() async {
    var url = Uri.parse("http://192.168.232.2/Hi_Baby/getdevelopment.php");
    var map = new Map<String, dynamic>();
    var respons = await http.post(url, body: map);
    var list = json.decode(respons.body);
    return list;
  }

  _newsSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => NewsScreen(news: breaking_news[index]),
          ),
        ),
        child: Stack(
          children: <Widget>[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ],
                ),
                child: Center(
                  child: Hero(
                    tag: 'assets/images/cring.jpg',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: AssetImage('assets/images/cring.jpg'),
                        height: 220.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //Breaking news text details
            Positioned(
              left: 28.0,
              bottom: 28.0,
              child: Container(
                width: 250.0,
                child: Text(
                  breaking_news[index].title.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
    final bool displayMobileLayout = MediaQuery.of(context).size.width < 600;
    return Row(
      children: [
        /* if (!displayMobileLayout)
          const AppDrawer(
            permanentlyDisplay: true,
          ),*/
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 70, // Set this height

              backgroundColor: Colors.blueGrey,
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
            /* drawer: displayMobileLayout
                ? const AppDrawer(
                    permanentlyDisplay: false,
                  )
                : null,*/
            body: ListView(
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
                

                //Top slider starts from here
                
                //News category starts from here
                //NewsCategories(),
                SingleChildScrollView(
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
                                margin: EdgeInsets.only(right: 10, left: 10),
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
                ),
                 Container(
                  height: 280.0,
                  width: double.infinity,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: breaking_news.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _newsSelector(index);
                    },
                  ),
                ),
                SizedBox(height: 20.0),
                //Content scrall starts from here
                ContentScroll(
                  imageUrl: trending_pic,
                  title: 'Trending',
                  imageHeight: 250.0,
                  imageWidth: 150.0,
                ),
                
              ],
            ),
          ),
        )
      ],
    );
  }
}
