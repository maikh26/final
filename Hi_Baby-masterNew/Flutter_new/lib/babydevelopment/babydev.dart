import 'package:flutter/material.dart';
import 'package:flutter_colorful_tab/flutter_colorful_tab.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Colorful Tab Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 9);
    super.initState();
  }

  Widget _pageView(int index) {
  

      return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, i) => Card(
        
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    
                    children: const [
                      
                      Text(
                        "mai",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Baby Development"),
        backgroundColor: Colors.deepPurpleAccent,
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
                    color: Colors.blue.shade600,
                    unselectedColor: Colors.blue.shade400),
                TabItem(
                    title: Text(
                      '2 Week',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.blue.shade600,
                    unselectedColor: Colors.blue.shade400),
                TabItem(
                    title: Text(
                      '3 Week',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.blue.shade600,
                    unselectedColor: Colors.blue.shade400),
                TabItem(
                    title: Text(
                      '4 Week',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.blue.shade600,
                    unselectedColor: Colors.blue.shade400),
                TabItem(
                    title: Text(
                      '5 Week',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.blue.shade600,
                    unselectedColor: Colors.blue.shade400),
                TabItem(
                    title: Text(
                      '6 Week',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.blue.shade600,
                    unselectedColor: Colors.blue.shade300),
                TabItem(
                    title: Text(
                      '7 Week',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.blue.shade600,
                    unselectedColor: Colors.blue.shade300),
                TabItem(
                    title: Text(
                      '8 Week',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.blue.shade600,
                    unselectedColor: Colors.blue.shade300),
                TabItem(
                    title: Text(
                      '9 Week',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    color: Colors.blue.shade600,
                    unselectedColor: Colors.blue.shade300),
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
}
