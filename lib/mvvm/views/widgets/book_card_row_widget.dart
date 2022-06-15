// ignore_for_file: must_be_immutable

import 'package:books_demo/mvvm/views/widgets/book_text_widget.dart';
import 'package:flutter/material.dart';

class BookCardRowWidget extends StatelessWidget {
  BookCardRowWidget({
    Key? key,
    required this.header,
    required this.data,
  }) : super(key: key);
  String header;
  String data;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        BookTextWidget(header),
        BookTextWidget(data),
      ],
    );
  }
}
