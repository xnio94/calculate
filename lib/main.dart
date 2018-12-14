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
  MyButton(x, f, context)
      : super(
            message: x,
            child: new RaisedButton(
              child: Text(x,
                  style: TextStyle(fontSize: 30, color: Color(0xFFFFFFFF))),
              color: Theme.of(context).accentColor,
              splashColor: Colors.blueGrey,
              onPressed: f,
            ));
}

class _MyHomePageState extends State<MyHomePage> {
  double num = 0;
  double res = 0;
  String op;
  void pressNum(x) {
    setState(() {
      num *= 10;
      num += x;
    });
  }

  void pressOpp(x) {
    setState(() {
      if (op == null)
        res = num;
      else {
        if (op == "*") res = res * num;
        if (op == "/") {
          if (num != 0)
            num = res / res;
          else
            print("problem : no devid by 0 ");
        }
        if (op == "+") res = res + num;
        if (op == "-") res = res - num;
        op = null;
      }

      num = 0;
      op = x;
    });
  }

  void pressEql() {
    setState(() {
      if (op == null)
        res = num;
      else {
        if (op == "*") num = res * num;
        if (op == "/") {
          if (num != 0)
            num = res / num;
          else
            print("problem : no devid by 0 ");
        }
        if (op == "+") num = res + num;
        if (op == "-") num = res - num;
        op = null;
      }
    });
  }

  void pressC() {
    setState(() {
      num = 0;
      res = 0;
    });
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
              //new Icon(Icons.star, size: 100.0),
              Container(
                  // color: Colors.blueAccent,
                  height: 80,
                  child: Center(
                    child: Text(
                      (num == num.floor())
                          ? num.floor().toString()
                          : num.toString(),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ), //color: Colors.white),
                    ),
                  ))
            ],
          ),
          new Row /*or Column*/ (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MyButton('1', () => pressNum(1), context),
              MyButton('2', () => pressNum(2), context),
              MyButton('3', () => pressNum(3), context),
              MyButton('+', () => pressOpp('+'), context),
            ],
          ),
          new Row /*or Column*/ (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MyButton('4', () => pressNum(4), context),
              MyButton('5', () => pressNum(5), context),
              MyButton('6', () => pressNum(6), context),
              MyButton('-', () => pressOpp('-'), context)
            ],
          ),
          new Row /*or Column*/ (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MyButton('7', () => pressNum(7), context),
              MyButton('8', () => pressNum(8), context),
              MyButton('9', () => pressNum(9), context),
              MyButton('*', () => pressOpp('*'), context),
            ],
          ),
          new Row /*or Column*/ (
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              MyButton('C', pressC, context),
              MyButton('0', () => pressNum(0), context),
              MyButton('=', pressEql, context),
              MyButton('/', () => pressOpp('/'), context),
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
