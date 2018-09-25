import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rsscollector/ArticlesEntity.dart';
import 'package:rsscollector/ProgressDialogView.dart';
import 'package:rsscollector/data/RemoteDB.dart';
import 'ArticleDetailView.dart';

class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);
  // DetailScreen({Key key, @required this.todo}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with AutomaticKeepAliveClientMixin {
  List<ArticlesEntity> _listData = [];
  List _apiListData = [];
  RemoteDB remoteDB = RemoteDB();
  int index = 0;

  bool isLoading = false;

  // ScrollController _scrollController = new ScrollController();

  // TODO: implement wantKeepAlive
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    loadDataApi();
    // _scrollController.addListener(() {
    //   if (_scrollController.position.pixels ==
    //       _scrollController.position.maxScrollExtent) {
    //     loadDataHome(_apiListData[index]);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (_listData.length == 0) {
      return ProgressDialogView.getProgressDialog();
    } else {
      return new RefreshIndicator(
        child: ListView.separated(
          physics: new AlwaysScrollableScrollPhysics(),
          // controller: _scrollController,
          itemCount: _listData.length,
          separatorBuilder: (BuildContext context, int index) => const Divider(),
          itemBuilder: (BuildContext context, int position) {
            if (position >= _listData.length - 1) {//如果已经达到数组的末尾
              loadDataHome(_apiListData[index]);
            }
            return ListTile(
                  onTap: (){
                    Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                    return new ArticleDetailView(article: _listData[position]);
                  }));
                  },
                  title: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Text(
                      _listData[position].title,
                      textAlign: TextAlign.left,
                      style: new TextStyle(color: Colors.black, fontSize: 18.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          _listData[position].rss_title,
                          textAlign: TextAlign.left,
                          style:
                              new TextStyle(color: Colors.grey, fontSize: 14.0),
                        ),
                        Text(
                          _listData[position].pubDate,
                          textAlign: TextAlign.right,
                          style:
                              new TextStyle(color: Colors.grey, fontSize: 14.0),
                        )
                      ],
                    )
                  ],
                ));
          }),
          onRefresh: () {return handleRefresh();}
      ); 
    }
  }

  loadDataApi() async {
    index = 0;
    var result = await remoteDB.getApiList();
    setState(() {
      _apiListData = result.toList();
      loadDataHome(_apiListData[index]);
    });
  }

  loadDataHome(String dataURL) async {
    if (isLoading) {
      return;
    }
    isLoading = true;
    print(dataURL);
    
    List<ArticlesEntity>  result = await remoteDB.getHomeList(dataURL);
    
    setState(() {
      isLoading = false;
      if (index == 0) {
        _listData.clear();
      }
      index = index + 1;
      _listData.addAll(result);
    });
  }

  Future<void> handleRefresh() async {
    return await Future.delayed(Duration(seconds: 5), () {
      setState(() {
        index = 0;
        loadDataApi();
        return null;
      });
    });
  }
}
