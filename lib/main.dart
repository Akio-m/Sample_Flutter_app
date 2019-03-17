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

  static final _data = [
    Data('Apple', 200),
    Data('Banana', 150),
    Data('Peach', 300)
  ];
  Data _item;

  @override
  void initState() {
    super.initState();
    _item = _data[0];
  }

  void _setData() {
    setState(() {
      _item = (_data..shuffle()).first;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Text(
        _item.toString(),
        style: TextStyle(fontSize:32.0),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _setData,
        tooltip: 'set message.',
        child: Icon(Icons.star),
      ),
    );
  }
}

class Data {
  int _price;
  String _name;

  Data(this._name, this._price): super();

  @override
  String toString() {
    return _name + ':' + _price.toString() + 'yen';
  }
}