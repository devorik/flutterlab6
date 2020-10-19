import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(new Calculator());

class Calculator extends StatelessWidget {
  Widget build(BuildContext buildContext) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      home: new IphoneCalc(),
    );
  }
}

class IphoneCalc extends StatefulWidget {
  IphoneCalcState createState() => IphoneCalcState();
}

class IphoneCalcState extends State<IphoneCalc> {
  dynamic text = '';
  double firstNuber = 0;
  double secondNumber = 0;
  dynamic result = '';
  dynamic finalResult = '';
  dynamic operator = '';
  dynamic preOperator = '';

  void calculate(btnText) {
    if (btnText == 'C') {
      text = '0';
      firstNuber = 0;
      secondNumber = 0;
      result = '';
      finalResult = '';
      operator = '';
      preOperator = '';
    } else if (operator == '=' && btnText == '=') {
      if (preOperator == '+') {
        finalResult = add();
      } else if (preOperator == '-') {
        finalResult = sub();
      } else if (preOperator == 'x') {
        finalResult = mul();
      } else if (preOperator == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' ||
        btnText == '-' ||
        btnText == 'x' ||
        btnText == '/' ||
        btnText == '=') {
      if (firstNuber == 0) {
        firstNuber = double.parse(result);
      } else {
        secondNumber = double.parse(result);
      }

      if (operator == '+') {
        finalResult = add();
      } else if (operator == '-') {
        finalResult = sub();
      } else if (operator == 'x') {
        finalResult = mul();
      } else if (operator == '/') {
        finalResult = div();
      }
      preOperator = operator;
      operator = btnText;
      result = '';
    } else if (btnText == '%') {
      result = firstNuber / 100;
      finalResult = doesContainDecimal(result);
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (firstNuber + secondNumber).toString();
    firstNuber = double.parse(result);
    return result;
  }

  String sub() {
    result = (firstNuber - secondNumber).toString();
    firstNuber = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (firstNuber * secondNumber).toString();
    firstNuber = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (firstNuber / secondNumber).toString();
    firstNuber = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }

  Widget build(BuildContext buildContext) {
    return new Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60.0,
                  ),
                  textAlign: TextAlign.right,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              button('C', Color(0xffa5a5a5)),
              button('+/-', Color(0xffa5a5a5)),
              button('%', Color(0xffa5a5a5)),
              button('/', Colors.orange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              button('7', Color(0xffa5a5a5)),
              button('8', Color(0xffa5a5a5)),
              button('9', Color(0xffa5a5a5)),
              button('x', Colors.orange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              button('4', Color(0xffa5a5a5)),
              button('5', Color(0xffa5a5a5)),
              button('6', Color(0xffa5a5a5)),
              button('-', Colors.orange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              button('1', Color(0xffa5a5a5)),
              button('2', Color(0xffa5a5a5)),
              button('3', Color(0xffa5a5a5)),
              button('+', Colors.orange),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              buttonZero('0', Color(0xffa5a5a5)),
              button('.', Color(0xffa5a5a5)),
              button('=', Colors.orange),
            ],
          ),
        ],
      ),
    );
  }

  Widget button(btnText, Color color) {
    return Container(
      padding: EdgeInsets.only(bottom: 15.0),
      child: RaisedButton(
        child: Text(
          btnText,
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
        onPressed: () {
          calculate(btnText);
        },
        color: color,
        padding: EdgeInsets.all(20.0),
      ),
    );
  }

  Widget buttonZero(btnText, Color color) {
    return Container(
      padding: EdgeInsets.only(bottom: 15.0),
      child: RaisedButton(
        child: Text(
          btnText,
          style: TextStyle(
            fontSize: 30.0,
          ),
        ),
        onPressed: () {
          calculate(btnText);
        },
        color: color,
        padding: EdgeInsets.only(left: 86, top: 20, right: 86, bottom: 20),
      ),
    );
  }
}
