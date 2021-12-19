import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'app_route_observer.dart';


//custom drawer for iOS device only
class AppDrawer extends StatefulWidget {
  const AppDrawer({@required this.permanentlyDisplay, Key key})
      : super(key: key);

  final bool permanentlyDisplay;

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> with RouteAware {
  String _selectedRoute;
  AppRouteObserver _routeObserver;
  @override
  void initState() {
    super.initState();
    _routeObserver = AppRouteObserver();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    _routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    _updateSelectedRoute();
  }

  @override
  void didPop() {
    _updateSelectedRoute();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.white,
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(
                      top: 30,
                      bottom: 10,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                        image: ExactAssetImage('assets/images/twoweek.PNG'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Text(
                    'Hi Baby',
                    style: TextStyle(fontSize: 22, color: Colors.teal),
                  ),
                  Text(
                    '',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height - 245,
            child: ListView(
              children: <Widget>[
               
                const Divider(),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.wallet),
                 /* title: const Text(
                    ScreenTitles.wallet,
                    style: TextStyle(fontSize: 16.0),
                  ),*/
                  trailing: const Icon(Icons.arrow_right),
                  onTap: (){}
                 // selected: _selectedRoute == RouteNames.wallet,
                ),
               /* ListTile(
                  leading: const Icon(FontAwesomeIcons.cog),
                  title: const Text(
                    ScreenTitles.settings,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  trailing: const Icon(Icons.arrow_right),
                  onTap: () async {
                    await _navigateTo(context, RouteNames.settings);
                  },
                  selected: _selectedRoute == RouteNames.settings,
                ),
                ListTile(
                  leading: const Icon(FontAwesomeIcons.weixin),
                  title: const Text(
                    ScreenTitles.help,
                    style: TextStyle(fontSize: 16.0),
                  ),
                  trailing: const Icon(Icons.arrow_right),
                  onTap: () async {
                    await _navigateTo(context, RouteNames.help);
                  },
                  selected: _selectedRoute == RouteNames.help,
                ),*/
              ],
            ),
          ),
         
          if (widget.permanentlyDisplay)
            const VerticalDivider(
              width: 1,
            ),
        ],
      ),
    );
  }

  /// Closes the drawer if applicable (which is only when it's not been displayed permanently) and navigates to the specified route
  /// In a mobile layout, the a modal drawer is used so we need to explicitly close it when the user selects a page to display
  Future<void> _navigateTo(BuildContext context, String routeName) async {
    if (widget.permanentlyDisplay) {
      Navigator.pop(context);
    }
    await Navigator.pushNamed(context, routeName);
  }

  void _updateSelectedRoute() {
    setState(() {
      _selectedRoute = ModalRoute.of(context).settings.name;
    });
  }
}