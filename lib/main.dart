import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter/rendering.dart';
import 'dart:typed_data';
import 'dart:async';


void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Name'),
      ),
      body: Center(
        child: MyRenderBoxWidget(),
      ),
    );
  }
}

class MyRenderBoxWidget extends SingleChildRenderObjectWidget {

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _MyRenderBox();
  }
}

class _MyRenderBox extends RenderBox {
  ui.Image _img;

  @override
  bool hitTest(HitTestResult result, { @required Offset position }) {
    return true;
  }

  _MyRenderBox(){
    loadAssetImage('automata.png');
  }

  loadAssetImage(String fname) => rootBundle.load("assets/$fname").then((bd) {
    Uint8List u8lst = Uint8List.view(bd.buffer);
    ui.instantiateImageCodec(u8lst).then((codec){
      codec.getNextFrame().then((frameInfo) {
        _img = frameInfo.image;
        markNeedsPaint();
        print ("_img created: $_img");
      });
    });
  });

  @override
  void paint(PaintingContext context, Offset offset) {
    Canvas c = context.canvas;
    int dx = offset.dx.toInt();
    int dy = offset.dy.toInt();

    Paint p = Paint();
    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(150, 0, 200, 255);
    Rect r = Rect.fromLTWH(dx+50.0, dy+50.0, 150.0, 150.0);
    c.drawRect(r, p);

    p.style = PaintingStyle.stroke;
    p.color = Color.fromARGB(150, 200, 0, 255);
    p.strokeWidth = 10.0;
    r = Rect.fromLTWH(dx+100.0, dy+100.0, 150.0, 150.0);
    c.drawRect(r, p);

    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(150, 0, 200, 255);
    Offset ctr = Offset(dx+150.0, dy+150.0);
    c.drawCircle(ctr, 75.0, p);

    p.style = PaintingStyle.stroke;
    p.strokeWidth = 5.0;
    p.color = Color.fromARGB(150, 255, 200, 0);
    for (var i=0; i <= 10; i++) {
      Rect r = Rect.fromLTRB(dx+50.0+20*i, dy+50.0, dx+50.0, dy+250.0-20*i);
      c.drawLine(r.topLeft, r.bottomRight, p);
    }

    ui.ParagraphBuilder builder = ui.ParagraphBuilder(
      ui.ParagraphStyle(textDirection: TextDirection.ltr),
    )
    ..pushStyle(ui.TextStyle(color: Colors.red, fontSize: 48.0))
    ..addText('Hello!')
    ..pushStyle(ui.TextStyle(color: Colors.blue[700], fontSize: 48.0))
    ..addText('This is a sample')
    ..pushStyle(ui.TextStyle(color: Colors.blue[200], fontSize: 30.0))
    ..addText('you an draw');

    ui.Paragraph paragraph = builder.build()
      ..layout(ui.ParagraphConstraints(width: 300.0));

    Offset off = Offset(dx+50.0, dy+50.0);
    c.drawParagraph(paragraph, off);

    if (_img != null) {
      c.drawImage(_img, off, p);
      print('draw _img');
    } else {
      print('_img is null.');
    }
  }

}