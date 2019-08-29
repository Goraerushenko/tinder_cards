import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'dart:ui';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> _list;
  CardController controller;
  CardBuilder builder;
  var swipedCards = [];
  int counter = 0;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }
  void buildBuilder() {

  }
  @override
  Widget build(BuildContext context) {
    List<Color> _color = [Colors.red, Colors.blue, Colors.yellow, Colors.green, Colors.orange];
    Widget _card(i) => Container(
        color: i
    );
    setState(() {
      _list = [0,1,2,3,4].map((i) => _card(_color[i])).toList();
      builder =  (context, index) => _list[index];
    });
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){controller.triggerUndo() ;},
      ),
      body: Container(
        child: new BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0,),
          child: new Container(
            decoration: new BoxDecoration(
              color: Colors.black.withOpacity(0.2),
            ),
            child: _tinder(),
          ),
        ),
      ),
    );
  }
  Widget _tinder() => GestureDetector(
    child: TinderSwapCard(
        cardBuilder:  builder,
        totalNum: _list.length,
        orientation: AmassOrientation.BOTTOM,
        stackNum: 2,
        swipeEdge: 0.1,
        maxWidth: MediaQuery.of(context).size.width * 1.0,
        maxHeight: MediaQuery.of(context).size.width * 1.5,
        minWidth: MediaQuery.of(context).size.width * 0.9,
        minHeight: MediaQuery.of(context).size.width * 1.4,
        cardController: controller = CardController(),
        swipeUpdateCallback:
            (DragUpdateDetails details, Alignment align) {
          /// Get swiping card's alignment
          if (align.x < 0) {
          } else if (align.x > 0) {

            //Card is RIGHT swiping
          }
        },
        swipeCompleteCallback:
            (CardSwipeOrientation orientation, int index) {
          print(orientation);
        }
    ),
  );
}
