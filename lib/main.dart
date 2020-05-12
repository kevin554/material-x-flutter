import 'package:flutter/material.dart';
import 'package:rmaterialx/pages/bottomnavigation/bottom_navigation_article.dart';
import 'package:rmaterialx/pages/bottomnavigation/bottom_navigation_basic.dart';
import 'package:rmaterialx/pages/bottomnavigation/bottom_navigation_dark.dart';
import 'package:rmaterialx/pages/bottomnavigation/bottom_navigation_icon.dart';
import 'package:rmaterialx/pages/bottomnavigation/bottom_navigation_light_simple.dart';
import 'package:rmaterialx/pages/bottomnavigation/bottom_navigation_map_blue.dart';
import 'package:rmaterialx/pages/bottomnavigation/bottom_navigation_primary.dart';
import 'package:rmaterialx/pages/bottomnavigation/bottom_navigation_shifting.dart';
import 'package:rmaterialx/pages/bottomnavigation/bottom_navigation_light.dart';
import 'package:rmaterialx/pages/bottomnavigation/bottom_navigation_shop.dart';
import 'package:rmaterialx/pages/bottomnavigation/bottom_navigation_small.dart';


void main() {
  runApp(MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        accentColor: Colors.blue,
        unselectedWidgetColor: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
      navigatorKey: navigatorKey,
      routes: <String, WidgetBuilder> {
        BottomNavigationBasic.route: (_) => BottomNavigationBasic(),
        BottomNavigationShifting.route: (_) => BottomNavigationShifting(),
        BottomNavigationLight.route: (_) => BottomNavigationLight(),
        BottomNavigationDark.route: (_) => BottomNavigationDark(),
        BottomNavigationIcon.route: (_) => BottomNavigationIcon(),
        BottomNavigationPrimary.route: (_) => BottomNavigationPrimary(),
        BottomNavigationMapBlue.route: (_) => BottomNavigationMapBlue(),
        BottomNavigationLightSimple.route: (_) => BottomNavigationLightSimple(),
        BottomNavigationArticle.route: (_) => BottomNavigationArticle(),
        BottomNavigationShop.route: (_) => BottomNavigationShop(),
        BottomNavigationSmall.route: (_) => BottomNavigationSmall(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff303030),
        elevation: 0,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('MaterialX'),
      ),
      body: Container(
        color: Color(0xff303030),
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) => EntryItem(data[index]),
          itemCount: data.length,
        ),
      )
    );
  }

}

// One entry in the multilevel list displayed by this app.
class Entry {
  Entry(this.title, {IconData icon, List<Entry> children, String route}) : icon = icon, children = children, route = route;
  final String title;
  IconData icon;
  final List<Entry> children;
  final String route;
}

// The entire multilevel list displayed by this app.
final List<Entry> data = <Entry>[
  Entry('Bottom Navigation',
    icon: Icons.view_column,
    children: <Entry>[
      Entry('Basic', route: BottomNavigationBasic.route),
      Entry('Shifting', route: BottomNavigationShifting.route),
      Entry('Light', route: BottomNavigationLight.route),
      Entry('Dark', route: BottomNavigationDark.route),
      Entry('Icon', route: BottomNavigationIcon.route),
      Entry('Primary', route: BottomNavigationPrimary.route),
      Entry('Map Blue', route: BottomNavigationMapBlue.route),
      Entry('Light Simple', route: BottomNavigationLightSimple.route),
      Entry('Article', route: BottomNavigationArticle.route),
      Entry('Shop', route: BottomNavigationShop.route),
      Entry('Small', route: BottomNavigationSmall.route),
      Entry('Main', route: BottomNavigationSmall.route),
    ],
  ),
  Entry('Bottom Sheet',
    icon: Icons.call_to_action,
    children: <Entry>[
      Entry('Basic'),
      Entry('List'),
    ],
  ),
  Entry('Buttons',
    icon: Icons.touch_app,
    children: <Entry>[
      Entry('Basic'),
      Entry('Button In Utilities'),
    ],
  ),
];


// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile.
class EntryItem extends StatelessWidget {
  const EntryItem(this.entry);

  final Entry entry;

  Widget _buildTiles(Entry root) {
    if (root.children == null || root.children.isEmpty){
      return FlatButton(
          child: Align(
            child: Text(
              root.title,
              style: TextStyle(fontSize: 16, color: Color(0xFFe6e6e6)),
            ),
            alignment: Alignment.centerLeft),
          onPressed: () {
            if (root.route != null) {
              navigatorKey.currentState.pushNamed(root.route);
            }
          }
      );
    }

    return ExpansionTile(
      leading: Icon(root.icon),
      key: PageStorageKey<Entry>(root),
      title: Text(
        root.title,
        style: TextStyle(fontSize: 16, color: Color(0xFFe6e6e6))
      ),
      children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
