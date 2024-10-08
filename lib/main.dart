import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_simple_calculator/flutter_simple_calculator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculator'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(18.0),
          child: CalcWidget(),
        ),
      ),
    );
  }
}

class CalcWidget extends StatefulWidget {
  const CalcWidget({Key? key}) : super(key: key);

  @override
  _CalcWidgetState createState() => _CalcWidgetState();
}

class _CalcWidgetState extends State<CalcWidget> {
  double? _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return SimpleCalculator(
      value: _currentValue!,
      hideExpression: false,
      hideSurroundingBorder: true,
      autofocus: true,
      onChanged: (key, value, expression) {
        setState(() {
          _currentValue = value ?? 0;
        });
        if (kDebugMode) {
          print('$key\t$value\t$expression');
        }
      },
      onTappedDisplay: (value, details) {
        if (kDebugMode) {
          print('$value\t${details.globalPosition}');
        }
      },
      theme: const CalculatorThemeData(
        borderColor: Colors.black,
        borderWidth: 0, // Menghilangkan border
        displayColor: Colors.black,
        displayStyle: TextStyle(fontSize: 80, color: Colors.white),
        expressionColor: Colors.black54,
        expressionStyle: TextStyle(fontSize: 20, color: Colors.white70),
        operatorColor: Colors.orange, // Warna operator ala iPhone
        operatorStyle: TextStyle(fontSize: 30, color: Colors.white),
        commandColor: Colors.grey, // Warna command seperti 'AC' dan '='
        commandStyle: TextStyle(fontSize: 30, color: Colors.white),
        numColor: Colors.grey, // Warna tombol angka
        numStyle: TextStyle(fontSize: 40, color: Colors.white),
      ),
    );
  }
}
