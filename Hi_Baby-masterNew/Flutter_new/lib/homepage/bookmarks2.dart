import 'package:flutter/material.dart';
import 'bookmarks.dart';
import 'bookmarks_categorymenu.dart';
import 'custom_drawer.dart';
import 'detailsartivle.dart';
import 'news_details.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BookmarksScreen extends StatelessWidget {
  const BookmarksScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final bool displayMobileLayout = MediaQuery.of(context).size.width < 600;
    getData() async {
      var url = Uri.parse("http://192.168.232.2/Hi_Baby/getarticle.php");
      var map = new Map<String, dynamic>();
      var respons = await http.post(url, body: map);
      var list = json.decode(respons.body);
      return list;
    }

    return Row(
      children: [
        if (!displayMobileLayout)
          const AppDrawer(
            permanentlyDisplay: true,
          ),
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              // when the app isn't displaying the mobile version of app, hide the menu button that is used to open the navigation drawer
              automaticallyImplyLeading: displayMobileLayout,
              iconTheme: IconThemeData(color: Theme.of(context).buttonColor),
              title: Text('Articls'),
            ),
            drawer: displayMobileLayout
                ? const AppDrawer(
                    permanentlyDisplay: false,
                  )
                : null,
            body: Column(
              children: <Widget>[
                Expanded(
                  child: FutureBuilder(
                      future: getData(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasError) print(snapshot.error);
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            // ignore: missing_return
                            itemBuilder: (context, i) {
                              return GestureDetector(
                                onTap: () {
                                  print("object");
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => NewsScreen1(
                                          des: snapshot.data[i]['des'],
                                          title: snapshot.data[i]['title'],
                                          image: snapshot.data[i]['image'],
                                          id: snapshot.data[i]['id'],
                                          counter: snapshot.data[i]['favcounter']),
                                    ),
                                  );
                                },
                                /* GridTileBar(
                                  backgroundColor: Colors.black45,
                                  title:
                                      _GridTitleText(snapshot.data[i]['title']),
                                );
                                return Padding(
                  padding: const EdgeInsets.all(10.0),*/
                                child: Stack(
                                  children: <Widget>[
                                    Center(
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 20.0),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
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
                                            tag: snapshot.data[i]['image'],
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Image(
                                                image: AssetImage(
                                                  snapshot.data[i]['image'],
                                                ),
                                                height: 280.0,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                    //Breaking news text details
                                    Positioned(
                                      left: 13.0,
                                      bottom: 13.0,
                                      child: Container(
                                        width: 340.0,
                                        padding: EdgeInsets.all(9.0),
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [Colors.grey, Colors.black],
                                          ),
                                        ),
                                        child: Text(
                                          snapshot.data[i]['title']
                                              .toUpperCase(),
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
                              );
                            });
                      }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _GridTitleText extends StatelessWidget {
  const _GridTitleText(this.text);
  final String text;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }
}

class _GridDemoPhotoItem extends StatelessWidget {
  _GridDemoPhotoItem({
    Key key,
  }) : super(key: key);

  getData() async {
    var url = Uri.parse("http://192.168.232.2/Hi_Baby/getarticle.php");
    var map = new Map<String, dynamic>();
    var respons = await http.post(url, body: map);
    var list = json.decode(respons.body);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    final Widget image = Material(
      child: Container(
        decoration: new BoxDecoration(
          borderRadius: new BorderRadius.circular(10.0),
          color: Colors.white,
          boxShadow: [
            new BoxShadow(
              color: Colors.black54,
              blurRadius: 6.0,
              offset: new Offset(0.0, 4.0),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Image(
          image: AssetImage("assets/article/babyfeed.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );

    return FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) print(snapshot.error);
          return GestureDetector(
            child: ListView.builder(
                itemCount: snapshot.data.length,
                // ignore: missing_return
                itemBuilder: (context, i) {
                  onTap:
                  () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => NewsScreen(
                            des: snapshot.data[i]['des'],
                            title: snapshot.data[i]['title'],
                            image: snapshot.data[i]['image'],
                          ),
                        ),
                      );
                  return GridTileBar(
                    backgroundColor: Colors.black45,
                    title: _GridTitleText(snapshot.data[i]['title']),
                  );
                }),
          );
        });
  }
}
