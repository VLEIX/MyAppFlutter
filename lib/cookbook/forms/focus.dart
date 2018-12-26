import 'package:flutter/material.dart';

class FormFocus extends StatefulWidget {
  final title = 'Focus';

  @override
  _FormFocusState createState() => _FormFocusState();
}

class _FormFocusState extends State<FormFocus> {

  FocusNode _fNodeFirstTF;
  FocusNode _fNodeSecondTF;


  @override
  void initState() {
    super.initState();

    _fNodeFirstTF = new FocusNode();
    _fNodeSecondTF = new FocusNode();
  }

  @override
  void dispose() {
    _fNodeFirstTF.dispose();
    _fNodeSecondTF.dispose();

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
              autofocus: true,
              focusNode: _fNodeFirstTF,
              textInputAction: TextInputAction.next,
              onSubmitted: (value) {
                return FocusScope.of(context).requestFocus(_fNodeSecondTF);
              },
            ),
            TextField(
              focusNode: _fNodeSecondTF,
              textInputAction: TextInputAction.done,
              onSubmitted: (value) {
                _fNodeSecondTF.unfocus();
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_fNodeFirstTF.hasFocus) {
            return FocusScope.of(context).requestFocus(_fNodeSecondTF);
          } else if (_fNodeSecondTF.hasFocus) {
            return _fNodeSecondTF.unfocus();
          } else {
            return FocusScope.of(context).requestFocus(_fNodeFirstTF);
          }
        },
        tooltip: 'Focus Second Text Field',
        child: Icon(Icons.edit),
      ),
    );
  }
}
