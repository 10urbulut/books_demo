// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BookTextWidget extends StatelessWidget {
  BookTextWidget(
    this.data, {
    Key? key,
    this.overflow,
  }) : super(key: key);
  String data;
  TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      overflow: overflow,
      textScaleFactor: 1.15,
      style: const TextStyle(
        color: Colors.white,
        letterSpacing: 1,
      ),
    );
  }
}
