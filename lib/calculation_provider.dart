import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CalculationProvider extends ChangeNotifier{

  double? _firstNum;
  double? get firstNum => _firstNum;

  double? _secondNum;
  double? get secondNum => _secondNum;
  String? _history = '';
  String? get history => _history;
  String? _textToDisplay = '';
  String? get textToDisplay => _textToDisplay;
  String? _result;
  String? get result => _result;
  String? _operation;
  String? get operation => _operation;

  void btnOnClick(String value) {
    if (kDebugMode) {
      print(value);
    }
    if (value == "C") {
      _textToDisplay = '';
      _firstNum = 0;
      _secondNum = 0;
      _result = '';
    } else if (value == 'AC') {
      _textToDisplay = '';
      _firstNum = 0;
      _secondNum = 0;
      _result = '';
      _history = '0';
    } else if (value == '+' || value == '-' || value == 'X' || value == '/') {
      _firstNum = double.parse(textToDisplay!).toDouble();
      _result = '';
      _operation = value;
    }else if(value == '='){
      _secondNum = double.parse(textToDisplay!);
      if(operation == '+'){
        _result = (firstNum! + secondNum!).toString();
        _history = firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if(operation == '-'){
        _result = (firstNum! -  secondNum!).toString();
        _history = firstNum.toString() +  operation.toString() + secondNum.toString();
      }
      if(operation == 'X'){
        _result = (firstNum! *  secondNum!).toString();
        _history = firstNum.toString() + operation.toString() + secondNum.toString();
      }
      if(operation == '/'){
        _result = (firstNum! /  secondNum!).toString();
        _history = firstNum.toString() + operation.toString() + secondNum.toString();
      }
    }else{
      _result = int.parse(textToDisplay! + value).toString();
    }
      _textToDisplay = result;
    notifyListeners();
  }

  double _value = 1;
  double get value => _value;

  void setValue(double val){
    _value = val;
    notifyListeners();
  }


}