import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class ArticleRssDetailView extends StatefulWidget {
  final String title;
  final String content;
  ArticleRssDetailView({Key key, @required this.title, @required this.content,}) : super(key: key) ;

  @override
  _ArticleRssDetailViewState createState() => _ArticleRssDetailViewState();
}

class _ArticleRssDetailViewState extends State<ArticleRssDetailView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // print(widget.article.description);
    // String html = '<body>Hello world! <a href="www.html5rocks.com">HTML5 rocks!';
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        // body:Text('ddd'));
        body: SingleChildScrollView(
            child: new Html(
                data: widget.content,
                //Optional parameters:
                padding: EdgeInsets.all(8.0),
                backgroundColor: Colors.white70,
                defaultTextStyle: TextStyle(fontFamily: 'serif'),
                onLinkTap: (url) {
                  // open url in a webview
                  Navigator.of(context).push(new MaterialPageRoute(builder: (_) {
                    return new WebviewScaffold(
                        url: url,
                        appBar: new AppBar(
                          title: new Text(url),
                        ));
                  }));
                })));
  }
}
