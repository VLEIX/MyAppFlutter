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

import 'cookbook/persistence/readingWritingFiles.dart';
import 'cookbook/persistence/storingData.dart';

void main() {
  final Content aniCon1 = new Content('Opacity Demo', '/fadeInOut');
  final Topic heaAni = new Topic('Animation', [aniCon1], '/animation');

  final Content lisCon1 = new Content('Basic List', '/basicList');
  final Content lisCon2 = new Content('Long List', '/longList');
  final Content lisCon3 = new Content('Horizontal List', '/horizontalList');
  final Content lisCon4 = new Content('Grid List', '/gridList');
  final Content lisCon5 = new Content('Mixed List', '/mixedList');
  final Content lisCon6 = new Content('Dynamic Height', '/dynamicHeight');
  final Topic heaLis = new Topic('Lists', [lisCon1, lisCon2, lisCon3, lisCon4, lisCon5, lisCon6], '/lists');

  final Content perCon1 = new Content('Reading Writing Files', '/readingWritingFiles');
  final Content perCon2 = new Content('Storing Data', '/storingData');
  final Topic heaPer = new Topic('Persistence', [perCon1, perCon2], '/persistence');

  runApp(MaterialApp(
    title: 'Flutter Cookbook',
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(title: 'Flutter Cookbook', topics: [heaAni, heaLis, heaPer],),
      '/animation/fadeInOut': (context) => FadeInOut(),
      '/lists/basicList': (context) => BasicList(),
      '/lists/longList': (context) => LongList(
          items: List<String>.generate(10000, (i) => 'Item $i'
          )
      ),
      '/lists/horizontalList': (context) => HorizontalList(),
      '/lists/gridList': (context) => GridList(),
      '/lists/mixedList': (context) => ListDifferentTypes(
          items: List<ListItem>.generate(1000, (i) => i % 6 == 0
              ? HeadingItem('Heading $i')
              : MessageItem('Sender $i', 'Message body $i')
          )
      ),
      '/lists/dynamicHeight': (context) => DynamicHeightList(),

      '/persistence/readingWritingFiles': (context) => ReadingWritingFiles(storage: CounterStorage()),
      '/persistence/storingData': (context) => StoringData(),
    },
  ));
}

class MyApp extends StatelessWidget {
  final String title;
  final List<Topic> topics;

  MyApp({Key key, @required this.title, @required this.topics}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final listInfo = _getListInformation(topics);

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
            itemCount: listInfo.item1,
            itemBuilder: (context, index) {
              Tuple2<int, int> indexes = listInfo.item3[index];

              Topic topic = topics[listInfo.item2.indexOf(indexes.item1)];

              if (listInfo.item2.contains(index)) {
                return ListTile(
                  title: Text(
                    topic.title,
                    style: Theme.of(context).textTheme.headline,
                  ),
                );
              } else {
                Content content = topic.contentList[indexes.item2];

                return ListTile(
                  title: Text(content.title),
                  onTap: () {
                    Navigator.pushNamed(context, topic.routeName + content.routeName);
                  },
                );
              }
            }
        )
    );
  }
}

Tuple3<int, List, List> _getListInformation(List<Topic> topicList) {
  int counter = 0;
  List headerIndexes = new List();
  List<Tuple2<int, int>> indexes = new List();

  topicList.forEach((topic) {
    headerIndexes.add(counter);
    indexes.add(Tuple2(counter, counter));

    int i = 0;
    topic.contentList.forEach((content) {
      indexes.add(Tuple2(counter, i));

      i++;
    });

    counter++;
    counter = counter + topic.contentList.length;
  });

  return new Tuple3(counter, headerIndexes, indexes);
}

class Content {
  final String title;
  final String routeName;

  Content(this.title, this.routeName);
}

class Topic {
  final String title;
  final List<Content> contentList;
  final String routeName;

  Topic(this.title, this.contentList, this.routeName);
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