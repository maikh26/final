import 'package:blogapp/Profile/ProfileScreen.dart';
import 'package:blogapp/babydevelopment/babydev.dart';
import 'package:blogapp/group.dart';
import 'package:blogapp/schduleNotification/homeSchdule.dart';
import 'package:blogapp/vaccine/vaccine.dart';
import 'package:blogapp/videos/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import "colors.dart" as color;
import 'package:blogapp/videos/colors.dart'  as color;

import '../Pages/baby _sitter.dart';
import '../Pages/doctor.dart';
import '../Pages/gallary.dart';
import '../Pages/shapedashboard.dart';

class MyDashboard extends StatelessWidget {
  const MyDashboard({Key key, String username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
     
      body: Stack(
    
        children: [

        
          ClipPath(
            clipper: ShapeDashboard(),
            child: Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: <Color>[Colors.deepPurple, Colors.grey[300]],
              )),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    
                    children: const [
                      
                      Text(
                        "",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // const SizedBox(height: 15),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        primary: false,
                        children: [
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyHomePage(),
                                  ),
                                );
                              },
                              splashColor: Colors.pink,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Image(
                                      image: AssetImage(
                                        "assets/cubes.png",
                                      ),
                                   height: 80,
                                        width: 80 ),
                                    Text("Development"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
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
                              splashColor: Colors.blue,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Image(
                                      image: AssetImage("assets/crib-toy.png"),
                                   height: 80,
                                        width: 80 ),
                                    Text("Activities"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
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
                              splashColor: Colors.blue,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Image(
                                      image:
                                          AssetImage("assets/musical-note.png"),
                                   height: 80,
                                        width: 80 ),
                                    Text("Sound"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => homeschdule(),
                                  ),
                                );
                              },
                              splashColor: Colors.blue,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Image(
                                      image: AssetImage("assets/increase.png"),
                                     height: 80,
                                        width: 80),
                                    Text("Growth"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
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
                              splashColor: Colors.blue,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Image(
                                      image: AssetImage("assets/milk.png"),
                                     height: 80,
                                        width: 80),
                                    Text("Feeding"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
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
                              splashColor: Colors.blue,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Image(
                                        image: AssetImage(
                                          "assets/tooth.png",
                                        ),
                                        height: 80,
                                        width: 80),
                                    Text("Teeth"),
                                  ],
                                ),
                              ),
                            ),
                          ),
                         
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
