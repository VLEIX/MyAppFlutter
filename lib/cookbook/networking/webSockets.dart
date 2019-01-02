import 'package:flutter/material.dart';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSockets extends StatefulWidget {
  final title = 'Web Sockets';

  @override
  _WebSocketsState createState() => _WebSocketsState();
}

class _WebSocketsState extends State<WebSockets> {

  WebSocketChannel _channel;
  TextEditingController _textEController;

  @override
  void initState() {
    super.initState();

    _channel = IOWebSocketChannel.connect('ws://echo.websocket.org');
    _textEController = new TextEditingController();
  }

  @override
  void dispose() {
    _channel.sink.close();
    _textEController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Form(
              child: TextFormField(
                controller: _textEController,
                decoration: InputDecoration(labelText: 'Send a message'),
                validator: (value) {
                  if (value.trim().isEmpty) {
                    return 'Enter a message';
                  }
                },
              )
            ),
            StreamBuilder(
              stream: _channel.stream,
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
                );
              }
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: Icon(Icons.send),
      ),
    );
  }

  void _sendMessage() {
    if (_textEController.text.isNotEmpty) {
      _channel.sink.add(_textEController.text);
    }
  }
}