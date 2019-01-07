import 'dart:async' show Future;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';

import 'model/topic.dart';
import 'model/content.dart';
import 'util/util.dart';
import 'demo/randomWords.dart';
import 'cookbook/lists/basic.dart';
import 'cookbook/lists/horizontal.dart';
import 'cookbook/lists/grid.dart';
import 'cookbook/lists/differentTypes.dart';
import 'cookbook/lists/long.dart';
import 'cookbook/lists/dynamicHeight.dart';
import 'cookbook/forms/validation.dart';
import 'cookbook/forms/focus.dart';
import 'cookbook/forms/retrievingValue.dart';
import 'cookbook/forms/handlingChanges.dart';
import 'cookbook/forms/style.dart';
import 'cookbook/navigation/newScreen.dart';
import 'cookbook/navigation/newScreenNamedRoute.dart';
import 'cookbook/navigation/sendingData.dart';
import 'cookbook/navigation/returningData.dart';
import 'cookbook/navigation/animation.dart';
import 'cookbook/networking/fetchData.dart';
import 'cookbook/networking/authenticatedRequests.dart';
import 'cookbook/networking/parsingJSONBackground.dart';
import 'cookbook/networking/webSockets.dart';
import 'cookbook/persistence/readingWritingFiles.dart';
import 'cookbook/persistence/storingData.dart';
import 'cookbook/design/themesAndStyles.dart';
import 'cookbook/design/navigationDrawer.dart';
import 'cookbook/design/tabs.dart';
import 'cookbook/design/displayingSnackBars.dart';
import 'cookbook/design/customFonts.dart';
import 'cookbook/design/fontsFromAPackage.dart';

import 'cookbook/animation/fadeInOut.dart';

const KEY_FILE_TOPICS = 'topics.json';

Future<TopicList> _loadTopics() async {
  Util util = new Util();
  String jsonString = await util.loadStringFromFile(KEY_FILE_TOPICS);
  final jsonResponse = json.decode(jsonString.toString());

  return TopicList.fromJson(jsonResponse);
}

void main() async {

  final TopicList topicList = await _loadTopics();

  runApp(MaterialApp(
    title: 'Flutter Cookbook',
    theme: ThemeData(
      primarySwatch: Colors.blueGrey,
      accentColor: Colors.blueAccent,
      fontFamily: 'Raleway'
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => MyApp(title: 'Flutter Cookbook', topics: topicList.topics),
      '/demo/randomWordsGenerator': (context) => RandomWords(),
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
      '/forms/validation': (context) => FormValidation(),
      '/forms/focus': (context) => FormFocus(),
      '/forms/retrievingValue': (context) => FormRetrievingValue(),
      '/forms/handlingChanges': (context) => FormHandlingChanges(),
      '/forms/style': (context) => FormStyle(),
      '/navigation/newScreen': (context) => NewScreenFirstScreen(),
      '/navigation/newScreenNamedRoute': (context) => NewScreenNamedRouteFirstScreen(),
      '/navigation/newScreenNamedRoute/secondScreen' : (context) => NewScreenNamedRouteSecondScreen(),
      '/navigation/sendingData': (context) => SendingData(
        todoList: List.generate(20, (i) =>
          Todo(
            'Todo $i',
            'A description of what needs to be done for Todo $i',
          ),
        ),
      ),
      '/navigation/returningData': (context) => ReturningData(),
      '/navigation/animation': (context) => AnimationFirstScreen(),
      '/networking/fetchData': (context) => FetchData(),
      '/networking/authenticatedRequests': (context) => AuthenticatedRequests(),
      '/networking/parsingJSONBackground': (context) => ParsingJSONBackground(),
      '/networking/webSockets': (context) => WebSockets(),
      '/persistence/readingWritingFiles': (context) => ReadingWritingFiles(storage: CounterStorage()),
      '/persistence/storingData': (context) => StoringData(),
      '/design/themesAndStyles': (context) => ThemesAndStyles(),
      '/design/navigationDrawer': (context) => NavigationDrawer(),
      '/design/tabs': (context) => Tabs(),
      '/design/displayingSnackBars': (context) => DisplayingSnackBars(),
      '/design/customFonts': (context) => CustomFonts(),
      '/design/fontsFromAPackage': (context) => FontsFromAPackage(),

      '/animation/fadeInOut': (context) => FadeInOut()
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
