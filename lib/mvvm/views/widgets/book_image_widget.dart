// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../models/book_model/book_model.dart';

class BookImageWidget extends StatelessWidget {
  BookImageWidget({
    Key? key,
    required this.book,
    this.height,
    this.width,
    this.boxFit,
  }) : super(key: key);
  BookModel book;
  double? width;
  double? height;
  BoxFit? boxFit;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            book.image.toString(),
            fit: boxFit ?? BoxFit.fill,
            width: width ?? 55,
            height: height ?? 240,
            loadingBuilder: (context, widget, event) {
              if (event == null) {
                return widget;
              }
              return Center(
                heightFactor: 3,
                widthFactor: 3,
                child: CircularProgressIndicator(
                  value: (event.expectedTotalBytes != null)
                      ? event.cumulativeBytesLoaded / event.expectedTotalBytes!
                      : null,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
