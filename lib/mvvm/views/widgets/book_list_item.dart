// ignore_for_file: must_be_immutable

import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../models/book_model/book_model.dart';
import '../../view_models/book_view_model.dart';
import '../book_detail_view.dart';
import 'book_card_row_widget.dart';
import 'book_container_widget.dart';
import 'book_divider_widget.dart';
import 'book_image_widget.dart';

class BookListItem extends StatelessWidget {
  BookListItem({Key? key, required this.book, required this.isArrow})
      : super(key: key);
  bool isArrow;
  BookModel book;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BookContainerWidget(
          child: InkWell(
            onTap: () => context.router.pushWidget(BookDetailView(book: book)),
            child: Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          BookImageWidget(
                            book: book,
                            height: 120,
                            width: 100,
                          ),
                        ],
                      ),
                      _title,
                      isArrow
                          ? const Icon(Icons.arrow_right_alt_rounded)
                          : const SizedBox(),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () {
                    bool isFavorite = book.isFavorite ?? false;
                    book.isFavorite = !isFavorite;
                    context
                        .read<BookViewModel>()
                        .selectUnselectBookFavorite(book, isFavorite);
                  },
                  icon: _favoriteIconWithAnimation(context),
                )
              ],
            ),
          ),
        ),
        Divider(
          color: Colors.transparent,
          height: MediaQuery.of(context).size.height / 30,
        ),
      ],
    );
  }

  AnimatedCrossFade _favoriteIconWithAnimation(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: const Icon(
        Icons.favorite_border,
      ),
      secondChild: Icon(Icons.favorite,
          color: Theme.of(context).progressIndicatorTheme.color),
      crossFadeState: book.isFavorite == true
          ? CrossFadeState.showSecond
          : CrossFadeState.showFirst,
      duration: const Duration(milliseconds: 300),
    );
  }

  Column get _title {
    return Column(
      children: [
        BookCardRowWidget(header: "Title: ", data: book.title.toString()),
        const BookDividerWidget(),
        BookCardRowWidget(header: "Author: ", data: book.author.toString()),
        const BookDividerWidget(),
        BookCardRowWidget(header: "Genre:", data: book.genre.toString()),
        const BookDividerWidget(),
        BookCardRowWidget(
            header: "Published: ",
            data: DateFormat.yMd(/* localization ile tr format olabiliyor */)
                .format(book.published!)),
        const BookDividerWidget(),
      ],
    );
  }
}
