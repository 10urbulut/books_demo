// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';
import 'package:books_demo/mvvm/views/widgets/book_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/book_model/book_model.dart';
import '../book_detail_view.dart';
import 'book_card_row_widget.dart';
import 'book_container_widget.dart';
import 'book_divider_widget.dart';

class BookItemDetail extends StatelessWidget {
  BookItemDetail({
    Key? key,
    required this.book,
  }) : super(key: key);
  BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: BookContainerWidget(
        child: Card(
          child: ListTile(
            title: Column(
              children: [
                BookCardRowWidget(header: "Id: ", data: book.id.toString()),
                const BookDividerWidget(),
                BookCardRowWidget(
                    header: "Title: ", data: book.title.toString()),
                const BookDividerWidget(),
                BookCardRowWidget(
                    header: "Author: ", data: book.author.toString()),
                const BookDividerWidget(),
                BookCardRowWidget(header: "Isbn:", data: book.isbn.toString()),
                const BookDividerWidget(),
                BookCardRowWidget(
                    header: "Published:",
                    data: DateFormat.yMd().format(book.published!)),
                const BookDividerWidget(),
                BookCardRowWidget(
                    header: "Publisher:", data: book.publisher.toString()),
                const BookDividerWidget(),
                BookCardRowWidget(header: "Description:", data: ""),
                BookTextWidget(book.description.toString()),
                const BookDividerWidget(),
              ],
            ),
            onTap: () {
              context.router.pushWidget(BookDetailView(book: book));
            },
          ),
        ),
      ),
    );
  }
}
