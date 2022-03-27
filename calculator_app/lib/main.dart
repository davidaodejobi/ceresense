import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';

void main() {
  runApp(const CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(body: CalulatorBody()),
    );
  }
}

class CalulatorBody extends StatefulWidget {
  const CalulatorBody({
    Key? key,
  }) : super(key: key);

  @override
  State<CalulatorBody> createState() => _CalulatorBodyState();
}

class _CalulatorBodyState extends State<CalulatorBody> {
  int? firstNumber;
  int? secondNumber;
  String? displayNum1 = '';
  String? displayNum2 = '';
  String? result;
  String? displayText = '';
  String? theOperator;
  String displayOperator = '';
  List listOfHistory = [];

  void onButtonPressed(String button) {
    print(button);
    if (button == 'C') {
      firstNumber = 0;
      secondNumber = 0;
      displayNum1 = '';
      displayNum2 = '';
      displayOperator = '';
      result = '';
      displayText = '';
    } else if (button == 'R') {
      firstNumber = 0;
      secondNumber = 0;
      result = '';
      displayNum1 = '';
      displayNum2 = '';
      displayOperator = '';
      displayText = '';
      listOfHistory.clear();
    } else if (button == '%' && displayText!.isNotEmpty) {
      double res = 0;
      res = int.parse(displayText!) / 100;
      result = res.toString();
      displayOperator = '%';
      displayNum1 = int.parse(displayText!).toString();
    } else if (button == "<") {
      result = displayText!.substring(0, displayText!.length - 1);
    } else if (button == '+' ||
        button == '-' ||
        button == '*' ||
        button == '/') {
      firstNumber = int.parse(displayText!);

      result = '';
      theOperator = button;
    } else if (button == '=') {
      secondNumber = int.parse(displayText!);
      if (theOperator == '+') {
        result = (firstNumber! + secondNumber!).toString();
        displayNum1 = firstNumber.toString();
        displayNum2 = secondNumber.toString();
        displayOperator = theOperator!;
        // history = '$firstNumber $theOperator $secondNumber';
      } else if (theOperator == '-') {
        result = (firstNumber! - secondNumber!).toString();
        displayOperator = theOperator!;
        displayNum1 = firstNumber.toString();
        displayNum2 = secondNumber.toString();
        // history = '$firstNumber $theOperator $secondNumber';
      } else if (theOperator == '*') {
        result = (firstNumber! * secondNumber!).toString();
        displayNum1 = firstNumber.toString();
        displayNum2 = secondNumber.toString();
        displayOperator = theOperator!;
        // history = '$firstNumber $theOperator $secondNumber';
      } else if (theOperator == '/') {
        result = (firstNumber! / secondNumber!).toString();
        displayNum1 = firstNumber.toString();
        displayNum2 = secondNumber.toString();
        displayOperator = theOperator!;
        // history = '$firstNumber $theOperator $secondNumber';
      }
    } else {
      result = int.parse(displayText! + button).toString();
    }
    setState(() {
      displayText = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    //! double widthSize = MediaQuery.of(context).size.width;
    //? double heightSize = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Stack(
                children: [
                  const Positioned(
                    top: 5,
                    left: 5,
                    //TODO add glassmorphism here,
                    child: Text(
                      'kella',
                      style: TextStyle(
                        fontSize: 20,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: '$displayNum1 ',
                            style: const TextStyle(
                              fontSize: 40.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            children: [
                              TextSpan(
                                text: displayOperator,
                                style: const TextStyle(
                                  fontSize: 40.0,
                                  color: Color(0xFFFF6060),
                                ),
                              ),
                              TextSpan(
                                text: ' $displayNum2',
                                style: const TextStyle(
                                  fontSize: 40.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '$displayText',
                          style: const TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xFFE9F6FF),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        CalculatorButton(
                          isText: false,
                          icon: 'assets/icons/clear.svg',
                          onPressed: () => onButtonPressed('C'),
                        ),
                        CalculatorButton(
                          isText: false,
                          icon: 'assets/icons/percent.svg',
                          onPressed: () => onButtonPressed('%'),
                        ),
                        CalculatorButton(
                          isText: false,
                          icon: 'assets/icons/backspace.svg',
                          onPressed: () => onButtonPressed('<'),
                        ),
                        CalculatorButton(
                          isText: false,
                          icon: 'assets/icons/divide.svg',
                          onPressed: () => onButtonPressed('/'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        CalculatorButton(
                          isText: true,
                          text: '7',
                          onPressed: () => onButtonPressed('7'),
                        ),
                        CalculatorButton(
                          isText: true,
                          text: '8',
                          onPressed: () => onButtonPressed('8'),
                        ),
                        CalculatorButton(
                          isText: true,
                          text: '9',
                          onPressed: () => onButtonPressed('9'),
                        ),
                        CalculatorButton(
                          isText: false,
                          icon: 'assets/icons/multiply.svg',
                          onPressed: () => onButtonPressed('*'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        CalculatorButton(
                          isText: true,
                          text: '4',
                          onPressed: () => onButtonPressed('4'),
                        ),
                        CalculatorButton(
                          isText: true,
                          text: '5',
                          onPressed: () => onButtonPressed('5'),
                        ),
                        CalculatorButton(
                          isText: true,
                          text: '6',
                          onPressed: () => onButtonPressed('6'),
                        ),
                        CalculatorButton(
                          isText: false,
                          icon: 'assets/icons/minus.svg',
                          onPressed: () => onButtonPressed('-'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        CalculatorButton(
                          isText: true,
                          text: '1',
                          onPressed: () => onButtonPressed('1'),
                        ),
                        CalculatorButton(
                          isText: true,
                          text: '2',
                          onPressed: () => onButtonPressed('2'),
                        ),
                        CalculatorButton(
                          isText: true,
                          text: '3',
                          onPressed: () => onButtonPressed('3'),
                        ),
                        CalculatorButton(
                          isText: false,
                          icon: 'assets/icons/plus.svg',
                          onPressed: () => onButtonPressed('+'),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        CalculatorButton(
                          isText: true,
                          text: '.',
                          onPressed: () => onButtonPressed('.'),
                        ),
                        CalculatorButton(
                          isText: true,
                          text: '0',
                          onPressed: () => onButtonPressed('0'),
                        ),
                        CalculatorButton(
                          isText: false,
                          icon: 'assets/icons/restart.svg',
                          onPressed: () => onButtonPressed('R'),
                        ),
                        CalculatorButton(
                          isText: false,
                          icon: 'assets/icons/equal.svg',
                          onPressed: () => onButtonPressed('='),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    this.text = '',
    this.icon = '',
    this.isText = false,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final String? text;
  final String? icon;
  final bool? isText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 100,
        width: 100,
        child: TextButton(
          onPressed: onPressed,
          child: isText == true
              ? Text(
                  text!,
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                  ),
                )
              : WebsafeSvg.asset(
                  icon!,
                  width: 100,
                ),
        ),
      ),
    );
  }
}
