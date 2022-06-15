// ignore_for_file: must_be_immutable

import 'package:books_demo/mvvm/views/widgets/book_item_detail.dart';
import 'package:books_demo/mvvm/views/widgets/book_text_widget.dart';
import 'package:flutter/material.dart';

import '../../../common/constants/strings/title_strings.dart';
import '../models/book_model/book_model.dart';

class BookDetailView extends StatelessWidget {
  BookDetailView({Key? key, required this.book}) : super(key: key);
  BookModel book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BookTextWidget(TitleStrings.BOOK_DETAIL),
      ),
      body: ListView(
        children: [
          BookItemDetail(book: book),
          _imageField(book, context),
        ],
      ),
    );
  }

  _imageField(BookModel e, BuildContext context) {
    debugPrint(e.image);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.network(
          e.image.toString(),
          fit: BoxFit.cover,
          height: MediaQuery.of(context).size.width / 0.8,
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
    );
  }
}
