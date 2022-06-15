import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SomeErrorWidget extends StatelessWidget {
  SomeErrorWidget({
    Key? key,
    this.errorMessage,
    this.errorWidgetInCenter,
  }) : super(key: key);

  String? errorMessage;
  Widget? errorWidgetInCenter;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: errorWidgetInCenter ?? Text(errorMessage ?? 'Some error occured'),
    );
  }
}
