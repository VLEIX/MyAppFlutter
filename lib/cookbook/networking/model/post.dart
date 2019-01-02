import 'package:json_annotation/json_annotation.dart';

part 'post.g.dart';

@JsonSerializable()

class Post {
  final int userId;

  @JsonKey(name: 'id')
  final int idPost;

  final String title;
  final String body;

  Post({this.userId, this.idPost, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);
}