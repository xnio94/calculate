import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'SimpleCalculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

/*
class MyButton extends RaisedButton {
  MyButton(x, context)
      : super(
          child: Text(x),
          color: Theme.of(context).accentColor,
          //elevation: 4.0,
          splashColor: Colors.blueGrey,
          onPressed: () {},
        );
}

*/

class MyButton extends Tooltip {
  MyButton(x, context)
      : super(
            message: x,
            child: new RaisedButton(
              child: Text(x),
              color: Theme.of(context).accentColor,
              splashColor: Colors.blueGrey,
              onPressed: () {
                print("anas");


              },
            ));
}

class _MyHomePageState extends State<MyHomePage> {
  int NUM = 0;
  String op;

  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Row /*or Column*/ (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              new Icon(Icons.star, size: 100.0),
            ],
          ),
          new Row /*or Column*/ (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MyButton('1', context),
              MyButton('2', context),
              MyButton('3', context),
              MyButton('+', context),
            ],
          ),
          new Row /*or Column*/ (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MyButton('4', context),
              MyButton('5', context),
              MyButton('6', context),
              MyButton('-', context)
            ],
          ),
          new Row /*or Column*/ (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MyButton('7', context),
              MyButton('8', context),
              MyButton('9', context),
              MyButton('*', context),
            ],
          ),
          new Row /*or Column*/ (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MyButton('C', context),
              MyButton('0', context),
              MyButton('=', context),
              MyButton('/', context),
            ],
          ),
        ],
      ),

      /*
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      */
    );
  }
}
