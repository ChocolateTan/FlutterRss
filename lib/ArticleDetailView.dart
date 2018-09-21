import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:rsscollector/ArticlesEntity.dart';
import 'package:html_unescape/html_unescape.dart';

class ArticleDetailView extends StatefulWidget {
  final ArticlesEntity article;
  String content;
  ArticleDetailView({Key key, @required this.article}) : super(key: key) {
    String html = this.article.description;
    var unescape = new HtmlUnescape();
    html = unescape.convert(html);
    this.content = html;
  }

  @override
  _ArticleDetailViewState createState() => _ArticleDetailViewState();
}

class _ArticleDetailViewState extends State<ArticleDetailView> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // print(widget.article.description);
    // String html = '<body>Hello world! <a href="www.html5rocks.com">HTML5 rocks!';
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.article.title),
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
