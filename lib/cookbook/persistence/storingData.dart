import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class StoringData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final title = 'Storing Data';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
