import 'package:blogapp/Pages/doctor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorful_tab/flutter_colorful_tab.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colorful Tab Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue[50],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Colorful Tab Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
 // List babydev = [];
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 9);
    super.initState();
  }

  Widget _pageView(int index) {
   
     return FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return snapshot.hasData
              ? ListView.builder(
                  itemCount: 1,
                  // ignore: missing_return
                   itemBuilder: (context, i) => Card(
                             margin: const EdgeInsets.only(left: 5, right: 5, top:20),
                             
                            child: Container(
                                alignment: Alignment.topCenter,
            height: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  color: Colors.white),
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
                              height:100,
                              width:100,
                             // padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
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
                              height:75,

                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.brown[100],
                                ),

                               child: Text(
                   snapshot.data[index]['weight'] +"\n"+"- - - - - - - "+"\n"+ snapshot.data[index]['height'],
                   
        style: TextStyle(fontSize: 15, color: Colors.black
                    ),
                  ),
          
                             ) ],
                        ),
                          Column(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topLeft,
                              height:50,

                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                ),
                               
                             ) ],
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
                   snapshot.data[index]['development'],
        style: TextStyle(fontSize: 15, color: Colors.black
                    ),
                  ),
 ),
                       ] )))): Center(child: CircularProgressIndicator());
                 
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Baby Development"),
        backgroundColor: Colors.deepPurple,
        toolbarHeight: 50,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ColorfulTabBar(
              alignment: TabAxisAlignment.end,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white30,
              tabs: [
                TabItem(
                    title: Text(
                      '1 Week',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.deepPurpleAccent,
                    unselectedColor: Colors.deepPurple),
                TabItem(
                    title: Text(
                      '2 Week',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
color: Colors.deepPurpleAccent,
                    unselectedColor: Colors.deepPurple),
                TabItem(
                    title: Text(
                      '3 Week',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.deepPurpleAccent,
                    unselectedColor: Colors.deepPurple),
                TabItem(
                    title: Text(
                      '4 Week',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.deepPurpleAccent,
                    unselectedColor: Colors.deepPurple),
                TabItem(
                    title: Text(
                      '1 month',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.deepPurpleAccent,
                    unselectedColor: Colors.deepPurple),
                TabItem(
                    title: Text(
                      '2 month',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.deepPurpleAccent,
                    unselectedColor: Colors.deepPurple),
                TabItem(
                    title: Text(
                      '3 month',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                   color: Colors.deepPurpleAccent,
                   unselectedColor: Colors.deepPurple),
                TabItem(
                    title: Text(
                      '4 month',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.deepPurpleAccent,
                    unselectedColor: Colors.deepPurple),
                TabItem(
                    title: Text(
                      '5 month',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                   color: Colors.deepPurpleAccent,
                    unselectedColor: Colors.deepPurple),
              ],
              controller: _tabController,
            ),
            Expanded(
              child: TabBarView(
                  controller: _tabController,
                  children: List.generate(9, (index) => _pageView(index))),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  getData() async {
    var url = Uri.parse("http://192.168.232.2/Hi_Baby/getdevelopment.php");
    var map = new Map<String, dynamic>();
    var respons = await http.post(url, body: map);
    var list = json.decode(respons.body);
    // birth.add(list[0]['birthdat']);
    //print(birth[0]);
    
    return list;
  }
}
