import 'package:flutter/material.dart';
import 'demo/dynamicList.dart';
import 'cookbook/animation/fadeInOut.dart';
import 'cookbook/lists/basic.dart';
import 'cookbook/lists/horizontal.dart';
import 'cookbook/lists/grid.dart';
import 'cookbook/lists/differentTypes.dart';
import 'cookbook/lists/long.dart';
import 'cookbook/lists/dynamicHeight.dart';
import 'cookbook/navigation/newScreen.dart';
import 'cookbook/navigation/newScreenNamedRoute.dart';

void main() {
  final Content aniCon1 = new Content('Opacity Demo');
  final Header heaAni = new Header('Animation', [aniCon1]);

  final Content lisCon1 = new Content('Basic List');
  final Content lisCon2 = new Content('Long List');
  final Content lisCon3 = new Content('Horizontal List');
  final Content lisCon4 = new Content('Grid List');
  final Content lisCon5 = new Content('Mixed List');
  final Content lisCon6 = new Content('Dynamic Height');
  final Header heaLis = new Header('Lists', [lisCon1, lisCon2, lisCon3, lisCon4, lisCon5, lisCon6]);

  runApp(MyApp(title: 'Flutter Cookbook', headerList: [heaAni, heaLis],));
}

class MyApp extends StatelessWidget {
  final String title;
  final List<Header> headerList;

  MyApp({Key key, @required this.title, @required this.headerList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          itemCount: headerList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(headerList[index].title),
            );
          }
        )
      )
    );
  }
}

class Content {
  final String title;

  Content(this.title);
}

class Header {
  final String title;
  final List<Content> contentList;

  Header(this.title, this.contentList);
}