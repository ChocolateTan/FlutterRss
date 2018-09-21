import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rsscollector/CategoryEntity.dart';
import 'package:rsscollector/ProgressDialogView.dart';
import 'package:rsscollector/data/RemoteDB.dart';
import 'package:xml/xml.dart' as xml;

class CategoryRssView extends StatefulWidget {
  final CategoryEntity category;
  CategoryRssView({Key key, @required this.category}) : super(key: key);
  // DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  _CategoryRssViewState createState() => _CategoryRssViewState();
}

class _CategoryRssViewState extends State<CategoryRssView>
    with AutomaticKeepAliveClientMixin {
  RemoteDB remoteDB = RemoteDB();
  List listData = [];
  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    String result = await remoteDB.getRSS(widget.category.url);
    var document = xml.parse(result);
    var item = document.findAllElements("item");
    setState(() {
      listData = item.toList();
    });
  }

  getView() {
    if (listData.length == 0) {
      return ProgressDialogView.getProgressDialog();
    } else {
      return new RefreshIndicator(
          child: ListView.separated(
              physics: new AlwaysScrollableScrollPhysics(),
              // controller: _scrollController,
              itemCount: listData.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (BuildContext context, int position) {
                return Padding(
                    padding: EdgeInsets.all(15.0),
                    child: new GestureDetector(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          listData[position].findElements('title').single.text,
                          textAlign: TextAlign.left,
                          style: new TextStyle(
                              color: Colors.black, fontSize: 18.0),
                        ),
                      ],
                    )));
              }),
          onRefresh: () {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
        appBar: AppBar(
          title: Text(widget.category.name),
        ),
        // body:Text('ddd'));
        body: getView());
  }
}
