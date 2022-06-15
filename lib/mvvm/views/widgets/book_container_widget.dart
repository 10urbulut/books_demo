// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BookContainerWidget extends StatelessWidget {
  BookContainerWidget({
    Key? key,
    required this.child,
  }) : super(key: key);
  Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 0),
            blurRadius: 1,
            color: Theme.of(context).cardColor,
            spreadRadius: 5,
          ),
          BoxShadow(
            offset: const Offset(0, 0),
            blurRadius: 1,
            color: Theme.of(context).scaffoldBackgroundColor,
            spreadRadius: 1,
          ),
        ],
      ),
      child: child,
    );
  }
}
