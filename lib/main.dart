import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
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
  final Content aniCon1 = new Content('Opacity Demo', '/fadeInOut');
  final Header heaAni = new Header('Animation', [aniCon1], '/animation');

  final Content lisCon1 = new Content('Basic List', '/basicList');
  final Content lisCon2 = new Content('Long List', '/longList');
  final Content lisCon3 = new Content('Horizontal List', '/horizontalList');
  final Content lisCon4 = new Content('Grid List', '/gridList');
  final Content lisCon5 = new Content('Mixed List', '/mixedList');
  final Content lisCon6 = new Content('Dynamic Height', '/dynamicHeight');
  final Header heaLis = new Header('Lists', [lisCon1, lisCon2, lisCon3, lisCon4, lisCon5, lisCon6], '/lists');

  //runApp(MyApp(title: 'Flutter Cookbook', headerList: [heaAni, heaLis],));

  runApp(MaterialApp(
    title: 'Flutter Cookbook',
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(title: 'Flutter Cookbook', headerList: [heaAni, heaLis],),
      '/animation/fadeInOut': (context) => FadeInOut(),
      '/lists/basicList': (context) => BasicList(),
    },
  ));
}

class MyApp extends StatelessWidget {
  final String title;
  final List<Header> headerList;

  MyApp({Key key, @required this.title, @required this.headerList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listInfo = _getListInformation(headerList);
    //int headerIndex = 0;
    //int containIndex = -1;

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
            itemCount: listInfo.item1,
            itemBuilder: (context, index) {
              //containIndex++;
              final indexes = _getIndexes(listInfo.item2, index);

              if (listInfo.item2.contains(index)) {
                //headerIndex = listInfo.item2.indexOf(index);
                //containIndex = -1;
                return ListTile(
                  title: Text(
                    headerList[indexes.item1].title,
                    style: Theme.of(context).textTheme.headline,
                  ),
                );
              } else {
                return ListTile(
                  title: Text(headerList[indexes.item1].contentList[indexes.item2].title),
                  onTap: () {
                    Navigator.pushNamed(context, headerList[indexes.item1].routeName + headerList[indexes.item1].contentList[indexes.item2].routeName);
                  },
                );
              }
            }
        )
    );
  }
}

Tuple2<int, int> _getIndexes(List headerIndexes, int index) {
  int iHeader = 0;
  int iContent = 0;

  if (headerIndexes.contains(index)) {
    iHeader = headerIndexes.indexOf(index);
  } else {
    for (final headerIndex in headerIndexes) {
      if (index < headerIndex) {
        iHeader = headerIndexes.indexOf(headerIndex);
        iContent = index - headerIndex - 1;

        break;
      }
    }
  }

  return new Tuple2(iHeader, iContent);
}

Tuple2<int, List> _getListInformation(List<Header> headerList) {
  int counter = 0;
  List headerIndexes = new List();

  var stuff = {"hello": "dsd"};
  stuff.values;
  /*

  AAA
	a [0, 0] 1
	b [0, 1] 2
BBB
	a [3, 0] 4
	b [3, 1] 5
	c [3, 2] 6


[0, 3]
   */

  headerList.forEach((header) {
    headerIndexes.add(counter);

    counter++;
    counter = counter + header.contentList.length;
  });

  return new Tuple2(counter, headerIndexes);
}

class Content {
  final String title;
  final String routeName;

  Content(this.title, this.routeName);
}

class Header {
  final String title;
  final List<Content> contentList;
  final String routeName;

  Header(this.title, this.contentList, this.routeName);
}

/*
  [{
	"headerTitle": "Animation",
	"headerContent": [{
		"contentTitle": "Opacity Demo"
	}]
}, {
	"headerTitle": "Lists",
	"headerContent": [{
		"contentTitle": "Basic List"
	}, {
		"contentTitle": "Long List"
	}, {
		"contentTitle": "Horizontal List"
	}, {
		"contentTitle": "Grid List"
	}, {
		"contentTitle": "Mixed List"
	}, {
		"contentTitle": "Dynamic Height"
	}]
}]
   */