import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {

  final title = 'Flutter Sample';
  final message = 'Sample message';

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: 'Flutter Demo',
      home: new MyHomePage(
        title: this.title,
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({this.title}): super();

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String _message;

  @override
  void initState() {
    super.initState();
    _message = 'Hello!';
  }

  void _setMessage() {
    setState(() {
      _message = 'It was Tapped!';
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Text(
        _message,
        style: TextStyle(fontSize:32.0),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _setMessage,
        tooltip: 'set message.',
        child: Icon(Icons.star),
      ),
    );
  }
}