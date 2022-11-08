
import 'package:calculator_using_provider/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

import 'main.dart';

class CalculatorNeuApp extends StatefulWidget {
  @override
  _CalculatorNeuAppState createState() => _CalculatorNeuAppState();
}

class _CalculatorNeuAppState extends State<CalculatorNeuApp> {

  int? firstNum;
  int? secondNum;
  String? history;
  String? textToDisplay;
  String? result;
  String? operation;

  void btnOnClick(String btnValue){
    print(btnValue);
  }


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var fontSize = MediaQuery.of(context).size.aspectRatio;

    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    bool status = false;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FlutterSwitch(
                      activeIcon: const Icon(Icons.nightlight_round,),
                      inactiveIcon: const Icon(Icons.wb_sunny),
                      activeColor: Colors.green,
                      inactiveColor: Colors.red,
                      width: 80.0,
                      height: 40.0,
                      valueFontSize: 25.0,
                      toggleSize: 35.0,
                      borderRadius: 20.0,
                      padding: 5.0,
                      showOnOff: false,
                      value: status,
                      onToggle: (value){
                        setState((){
                          themeProvider.setTheme;
                        });
                      },
                    ),
                    // GestureDetector(
                    //     onTap: () {
                    //       setState(() {
                    //         darkMode ? darkMode = false : darkMode = true;
                    //       });
                    //     },
                    //     child: _switchMode()),
                    const SizedBox(height: 80),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '6.010',
                        style: TextStyle(
                          fontSize: 55,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          '=',
                          style: TextStyle(
                            fontSize: 35,),
                        ),
                        Text(
                          '10+500*12',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              Container(
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonOval(title: 'sin'),
                      _buttonOval(title: 'cos'),
                      _buttonOval(title: 'tan'),
                      _buttonOval(title: '%')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(
                        title: 'C',
                      ),
                      _buttonRounded(title: '('),
                      _buttonRounded(title: ')'),
                      _buttonRounded(
                        title: '/',
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '7'),
                      _buttonRounded(title: '8'),
                      _buttonRounded(title: '9'),
                      _buttonRounded(
                        title: 'x',
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '4'),
                      _buttonRounded(title: '5'),
                      _buttonRounded(title: '6'),
                      _buttonRounded(
                        title: '-',
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '1'),
                      _buttonRounded(title: '2'),
                      _buttonRounded(title: '3'),
                      _buttonRounded(
                        title: '+',
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buttonRounded(title: '0'),
                      _buttonRounded(title: ','),
                      _buttonRounded(
                        icon: Icons.backspace_outlined,
                      ),
                      _buttonRounded(
                        title: '=',
                      )
                    ],
                  )
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buttonRounded(
      {String? title,
        double padding = 17,
        IconData? icon,
        Color? iconColor,
        Color? textColor}) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: NeuContainer(
        borderRadius: BorderRadius.circular(40),
        padding: EdgeInsets.all(padding),
        child: Container(
          width: padding * 2,
          height: padding * 2,
          child: Center(
              child: title != null
                  ? Text(
                title,
                style: const TextStyle(
                    fontSize: 30),
              )
                  : Icon(
                icon,
                color: iconColor,
                size: 30,
              )),
        ),
      ),
    );
  }

  Widget _buttonOval({String? title, double padding = 17}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: NeuContainer(
        borderRadius: BorderRadius.circular(50),
        padding:
        EdgeInsets.symmetric(horizontal: padding, vertical: padding / 2),
        child: Container(
          width: padding * 2,
          child: Center(
            child: Text(
              '$title',
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Widget _switchMode() {
    return NeuContainer(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      borderRadius: BorderRadius.circular(40),
      child: SizedBox(
        width: 70,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(
                Icons.wb_sunny,
              ),
              Icon(
                Icons.nightlight_round,
              ),
            ]),
      ),
    );
  }
}

class NeuContainer extends StatefulWidget {
  final bool darkMode;
  final Widget child;
  final BorderRadius borderRadius;
  final EdgeInsetsGeometry padding;

  NeuContainer(
      {this.darkMode = false, required this.child, required this.borderRadius, required this.padding});

  @override
  _NeuContainerState createState() => _NeuContainerState();
}

class _NeuContainerState extends State<NeuContainer> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool darkMode = widget.darkMode;
    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: Container(
        padding: widget.padding,
        decoration: BoxDecoration(
            color: darkMode ? colorDark : colorLight,
            borderRadius: widget.borderRadius,
            boxShadow: _isPressed
                ? null
                : [
              BoxShadow(
                color:
                darkMode ? Colors.black54 : Colors.blueGrey.shade200,
                offset: Offset(4.0, 4.0),
                blurRadius: 15.0,
                spreadRadius: 1.0,
              ),
              BoxShadow(
                  color:
                  darkMode ? Colors.blueGrey.shade700 : Colors.white,
                  offset: Offset(-4.0, -4.0),
                  blurRadius: 15.0,
                  spreadRadius: 1.0)
            ]),
        child: widget.child,
      ),
    );
  }
}