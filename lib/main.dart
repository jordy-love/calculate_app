import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Caculator App'),
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
  var result = ""; // 결과
  var buffer = ""; // 출력버퍼
  List<int> numberArr = <int>[]; // 피연산자 배열
  List<String> operatorArr = <String>[]; // 연산자 배
  var pressedNumber = ""; // 들어온 값이 숫자이면 저장
  bool calc = false; // 계산완료 여부

  void initNumbers() {
    buffer = "";
    pressedNumber = "";
    numberArr.clear();
    operatorArr.clear();
  }

  void addNumbers(String key) {
    var operator = ['+', '-', '*', '/'];

    if (key == "C") {
      initNumbers();
    } else {
      if (operator.contains(key) || key == "=") {
        numberArr.add(int.parse(pressedNumber));
        operatorArr.add(key);
        pressedNumber = "";
      } else {
        pressedNumber += key;
      }
      buffer += key;
    }

    if (key == "=") {
      num firstOperand = numberArr[0]; // 첫번째 피연산자
      num sum = firstOperand; // 계산식 합계

      for (var i = 0; i < numberArr.length; i++) {
        if (i == 0) continue;
        String operator = operatorArr[i - 1];

        switch (operator) {
          case "+":
            sum = sum + numberArr[i];
            break;
          case "-":
            sum = sum - numberArr[i];
            break;
          case "/":
            sum = sum / numberArr[i];
            break;
          case "*":
            sum = sum * numberArr[i];
            break;
        }
        print('계산합: $sum');
      }

      initNumbers();
      buffer = sum.toString();

      // 계산완료
      calc = true;
      numberArr.add(sum);
    }

    print(numberArr.toString() + "," + operatorArr.toString());

    setState(() {
      result = buffer;
    });
  }

  @override
  void initState() {
    initNumbers();
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
        //padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 120,
              color: Colors.black,
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(right: 24, bottom: 24),
              child: Text(
                result,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                ),
              ),
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
                  onPressed: () => addNumbers('+'),
                  child: Text('+'),
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
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () => addNumbers('1'),
                    child: Text('1'),
                  ),
                  ElevatedButton(
                    onPressed: () => addNumbers('2'),
                    child: Text('2'),
                  ),
                  ElevatedButton(
                    onPressed: () => addNumbers('3'),
                    child: Text('3'),
                  ),
                  ElevatedButton(
                    onPressed: () => addNumbers('*'),
                    child: Text('*'),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => addNumbers('C'),
                  child: Text('C'),
                ),
                ElevatedButton(
                  onPressed: () => addNumbers('0'),
                  child: Text('0'),
                ),
                ElevatedButton(
                  onPressed: () => addNumbers('='),
                  child: Text('='),
                ),
                ElevatedButton(
                  onPressed: () => addNumbers('/'),
                  child: Text('/'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
