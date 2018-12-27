import 'package:flutter/material.dart';

class FormHandlingChanges extends StatefulWidget {
  final title = 'Handling Changes';

  @override
  _FormHandlingChangesState createState() => _FormHandlingChangesState();
}

class _FormHandlingChangesState extends State<FormHandlingChanges> {

  TextEditingController _textEController;

  @override
  void initState() {
    super.initState();

    _textEController = new TextEditingController();
    _textEController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
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
          children: <Widget>[
            TextField(
              onChanged: (value) {
                print('First text field: $value');
              },
            ),
            TextFormField(
              controller: _textEController,
            )
          ],
        ),
      ),
    );
  }

  _printLatestValue() {
    print('Second text field: ${_textEController.text}');
  }
}
