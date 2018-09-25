import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:rsscollector/HomeView.dart';

import 'data/RemoteDB.dart';
import 'CategoryView.dart';

void main() {
  // debugPaintSizeEnabled = true; //打开视觉调试开关
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Collector',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainAppPage(),
    );
  }
}

class MainAppPage extends StatefulWidget  {
  MainAppPage({Key key}) : super(key: key);

  @override
  _MainAppPageState createState() => _MainAppPageState();
}

class _MainAppPageState extends State<MainAppPage>
    with SingleTickerProviderStateMixin {
  List widgetsApi = [];
  List widgetsHome = [];
  int widgetsHomeIndex = 0;
  bool isLoading = false;
  List widgetsCategory = [];

  RemoteDB remoteDB = RemoteDB();

  TabController controller;

  HomeView homeView;
  CategoryView categoryView;

  @override
  void initState() {
    super.initState();
    controller = new TabController(vsync: this, length: 2);
    homeView = new HomeView();
    categoryView = new CategoryView();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Collector"),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          homeView,
          categoryView
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.blueAccent,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.home), text: "Home"),
            new Tab(icon: new Icon(Icons.category), text: "Category"),
          ],
        ),
      ),
    );
  }
}
