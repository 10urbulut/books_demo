import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Toastr {
  static const double _fontSize = 18.5;
  static const Color _textColor = Colors.white;
  static const int _timeInSecForIosWeb = 2;
  static const ToastGravity _toastGravity = ToastGravity.TOP;
  static const Toast _toastLength = Toast.LENGTH_SHORT;

  static buildToast(String message, Color backgroundColor,
      {Toast? length, ToastGravity? toastGravity}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: length ?? _toastLength,
      gravity: toastGravity ?? _toastGravity,
      timeInSecForIosWeb: _timeInSecForIosWeb,
      backgroundColor: backgroundColor,
      textColor: _textColor,
      fontSize: _fontSize,
    );
  }

  static buildSuccessToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: _toastLength,
      gravity: _toastGravity,
      timeInSecForIosWeb: _timeInSecForIosWeb,
      backgroundColor: Colors.green,
      textColor: _textColor,
      fontSize: _fontSize,
    );
  }

  static buildErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: _toastLength,
      gravity: _toastGravity,
      timeInSecForIosWeb: _timeInSecForIosWeb,
      backgroundColor: Colors.red,
      textColor: _textColor,
      fontSize: _fontSize,
    );
  }

  static buildNotifyToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: _toastLength,
      gravity: _toastGravity,
      timeInSecForIosWeb: _timeInSecForIosWeb,
      backgroundColor: Colors.amber.shade800,
      textColor: _textColor,
      fontSize: _fontSize,
    );
  }
}
