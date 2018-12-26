import 'package:flutter/material.dart';

class FormRetrievingValue extends StatefulWidget {
  final title = 'Retrieving Value';

  @override
  _FormRetrievingValueState createState() => _FormRetrievingValueState();
}

class _FormRetrievingValueState extends State<FormRetrievingValue> {

  final _formKey = GlobalKey<FormState>();

  TextEditingController _textEController;

  @override
  void initState() {
    super.initState();

    _textEController = new TextEditingController();
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
      body: Builder(builder: (context) => Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextFormField(
            controller: _textEController,
            validator: (value) {
              if (value.trim().isEmpty) {
                return 'Please enter some text';
              }
            },
          ),
        )
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState.validate()) {
            return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(_textEController.text.trim()),
                  );
                }
            );
          }
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.text_fields),
      ),
    );
  }
}
