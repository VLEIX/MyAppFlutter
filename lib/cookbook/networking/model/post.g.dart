// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Post _$PostFromJson(Map<String, dynamic> json) {
  return Post(
      userId: json['userId'] as int,
      idPost: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String);
}

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'userId': instance.userId,
      'id': instance.idPost,
      'title': instance.title,
      'body': instance.body
    };
