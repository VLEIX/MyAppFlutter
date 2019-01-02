import 'dart:async' show Future;
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'model/post.dart';

Future<Post> fetchPost() async {
  final response = await http.get(
      'https://jsonplaceholder.typicode.com/posts/2',
      headers: {HttpHeaders.authorizationHeader: "Basic your_api_token_here"}
      );

  if (response.statusCode == 200) {
    return Post.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load post');
  }
}

class AuthenticatedRequests extends StatefulWidget {
  final title = 'Authenticated Requests';

  @override
  _AuthenticatedRequestsState createState() => _AuthenticatedRequestsState();
}

class _AuthenticatedRequestsState extends State<AuthenticatedRequests> {

  Future<Post> _post;

  @override
  void initState() {
    super.initState();

    _post = fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
          future: _post,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.title);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return CircularProgressIndicator();
          }
        ),
      ),
    );
  }
}
