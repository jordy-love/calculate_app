import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

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
  var _result = "";
  var _buffer = "";

  void addNumbers(String key) {
    var operator = ['+', '-', '÷', 'X'];
    print(key);

    if (key == "C")
      _buffer = "";
    else {
      _buffer += key;
    }
    // else if (operator.contains(key)) {

    setState(() {
      _result = _buffer;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _result,
              style: TextStyle(fontSize: 40),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => addNumbers('C'),
                  child: Text('C'),
                ),
                ElevatedButton(
                  onPressed: () => addNumbers(''),
                  child: Text(''),
                ),
                ElevatedButton(
                  onPressed: () => addNumbers('del'),
                  child: Text('del'),
                ),
                ElevatedButton(
                  onPressed: () => addNumbers('÷'),
                  child: Text('÷'),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => addNumbers('7'),
                  child: Text('7'),
                ),
                ElevatedButton(
                  onPressed: () => addNumbers('8'),
                  child: Text('8'),
                ),
                ElevatedButton(
                  onPressed: () => addNumbers('9'),
                  child: Text('9'),
                ),
                ElevatedButton(
                  onPressed: () => addNumbers('X'),
                  child: Text('X'),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => addNumbers('4'),
                  child: Text('4'),
                ),
                ElevatedButton(
                  onPressed: () => addNumbers('5'),
                  child: Text('5'),
                ),
                ElevatedButton(
                  onPressed: () => addNumbers('6'),
                  child: Text('6'),
                ),
                ElevatedButton(
                  onPressed: () => addNumbers('-'),
                  child: Text('-'),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => addNumbers('3'),
                  child: Text('3'),
                ),
                ElevatedButton(
                  onPressed: () => addNumbers('2'),
                  child: Text('2'),
                ),
                ElevatedButton(
                  onPressed: () => addNumbers('1'),
                  child: Text('1'),
                ),
                ElevatedButton(
                  onPressed: () => addNumbers('+'),
                  child: Text('+'),
                ),
              ],
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => addNumbers('0'),
                  child: Text('0'),
                ),
                ElevatedButton(
                  onPressed: () => addNumbers(''),
                  child: Text(''),
                ),
                ElevatedButton(
                  onPressed: () => addNumbers(''),
                  child: Text(''),
                ),
                ElevatedButton(
                  onPressed: () => addNumbers('='),
                  child: Text('='),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
