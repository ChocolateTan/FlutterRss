import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rsscollector/CategoryEntity.dart';
import 'package:rsscollector/CategoryRssView.dart';
import 'package:rsscollector/data/RemoteDB.dart';
import 'ProgressDialogView.dart';

class CategoryView extends StatefulWidget {
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView>
    with AutomaticKeepAliveClientMixin {
  List<CategoryEntity> _listData = [];
  RemoteDB remoteDB = RemoteDB();

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    loadCategory();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (_listData.length == 0) {
      return ProgressDialogView.getProgressDialog();
    } else {
      return new RefreshIndicator(
          child: ListView.separated(
              itemCount: _listData.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
              itemBuilder: (BuildContext context, int position) {
                // if (position.isOdd) {
                //   // 在每一列之前，添加一个1像素高的分隔线widget
                //   return const Divider();
                // }
                return ListTile(
                    onTap: () {
                      Navigator.of(context)
                          .push(new MaterialPageRoute(builder: (_) {
                        return new CategoryRssView(
                            category: _listData[position]);
                      }));
                    },
                    title: Container(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                _listData[position].name,
                                style: new TextStyle(
                                    color: Colors.grey, fontSize: 24.0),
                              )
                            ])));
              }),
          onRefresh: () {
            return handleRefresh();
          });
    }
  }

  loadCategory() async {
    var result = await remoteDB.getCategoryList();
    setState(() {
      _listData = result;
    });
  }

  Future<void> handleRefresh() async {
    return await Future.delayed(Duration(seconds: 5), () {
      setState(() {
        loadCategory();
        return null;
      });
    });
  }
}
