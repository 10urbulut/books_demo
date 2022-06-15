import 'package:flutter/material.dart';

class BookDividerWidget extends StatelessWidget {
  const BookDividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: 3,
      height: 5,
    );
  }
}
