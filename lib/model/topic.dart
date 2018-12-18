import 'package:my_app/model/content.dart';

class Topic {
  final String title;
  final String routeName;
  final List<Content> contentList;

  Topic({
    this.title,
    this.routeName,
    this.contentList
  });

  factory Topic.fromJson(Map<String, dynamic> parsedJson) {

    var list = parsedJson['contentList'] as List;
    List<Content> contentList = list.map((i) => Content.fromJson(i)).toList();

    return Topic(
      title: parsedJson['topicTitle'],
      routeName: parsedJson['routeName'],
      contentList: contentList
    );
  }
}

class TopicList {
  final List<Topic> topics;

  TopicList({
    this.topics,
  });

  factory TopicList.fromJson(List<dynamic> parsedJson) {

    List<Topic> topics = new List<Topic>();
    topics = parsedJson.map((i) => Topic.fromJson(i)).toList();

    return new TopicList(
        topics: topics
    );
  }
}