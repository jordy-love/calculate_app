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

class MyButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  double size;

  MyButton(this.label, this.onPressed);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width / 4;

    return Container(
      width: size,
      padding: EdgeInsets.all(2),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
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
        calc = false; // 계산완료후 연산자입력 받으면 계산완료변수 초기화
      } else {
        if (calc) {
          initNumbers(); // 계산완료후 숫자버튼을 바로누르면 버퍼초기화, 계산완료변수 초기화
          calc = false;
        }
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

      // 계산완료 & 계산완료후 추가입력을 받기위한 결과저장
      calc = true;
      pressedNumber = buffer;
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
              children: <Widget>[
                MyButton('7', () => addNumbers('7')),
                MyButton('8', () => addNumbers('8')),
                MyButton('9', () => addNumbers('9')),
                MyButton('+', () => addNumbers('+')),
              ],
            ),
            Row(
              children: <Widget>[
                MyButton('4', () => addNumbers('4')),
                MyButton('5', () => addNumbers('5')),
                MyButton('6', () => addNumbers('6')),
                MyButton('-', () => addNumbers('-')),
              ],
            ),
            Row(
              children: <Widget>[
                MyButton('1', () => addNumbers('1')),
                MyButton('2', () => addNumbers('2')),
                MyButton('3', () => addNumbers('3')),
                MyButton('*', () => addNumbers('*')),
              ],
            ),
            Row(
              children: <Widget>[
                MyButton('C', () => addNumbers('C')),
                MyButton('0', () => addNumbers('0')),
                MyButton('=', () => addNumbers('=')),
                MyButton('/', () => addNumbers('/')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
