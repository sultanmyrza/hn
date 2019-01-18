import 'package:flutter/material.dart';
import 'package:hnapp/article.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Article> _articles = articles;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter 101"),
      ),
      body: Center(
        child: RefreshIndicator(
          child: ListView(
            children: _articles.map(_buildItem).toList(),
          ),
          onRefresh: () async {
            await Future.delayed(Duration(seconds: 1));
            setState(() {
              _articles.removeAt(0);
            });
          },
        ),
      ),
    );
  }

  Widget _buildItem(Article article) {
    return Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(18.0),
      child: ExpansionTile(
        title: new Text(article.text),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text("comment count ${article.commentScore}"),
              IconButton(
                icon: Icon(Icons.launch),
                onPressed: () {},
              ),
            ],
          ),
        ],
//        onTap: () async {
//          final fakeUrl = "http://google.com";
//          if (await canLaunch(fakeUrl)) {
//            launch(fakeUrl);
//          }
//        },
      ),
    );
  }
}
