import 'package:fade/fade.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<bool> paidFunction() {
    return Future.delayed(Duration(seconds: 1)).then((value) => false);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Fade(
      // paid: false,
      paidFunction: paidFunction,
      // you can call your api here or any Future function
      dateTime: DateTime(2021, 4, 10),
      materialApp: MaterialApp(
        title: 'Fade',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'Flutter Fade  Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ContainerF(
                child: Container(
                  height: 60,
                  width: 60,
                  color: Colors.red,
                ),
                lastDaysToHideThis: 5, //this that tell your widget when to fade (days before fading)
            ),
            ContainerF(
                child: Container(
                  height: 60,
                  width: 60,
                  color: Colors.green,
                ),
                lastDaysToHideThis: 2),
            ContainerF(
                child: Container(
                  height: 60,
                  width: 60,
                  color: Colors.black,
                ),
                lastDaysToHideThis: 5),
            ContainerF(
              lastDaysToHideThis: 2,
              child: Text(
                'You have pushed the button this many times:',
              ),
            ),
            ContainerF(
              lastDaysToHideThis: 9,
              child: Text(
                'You have pushed the button this many times11111111111:',
              ),
            ),
            ContainerF(
              lastDaysToHideThis: 3,
              child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
