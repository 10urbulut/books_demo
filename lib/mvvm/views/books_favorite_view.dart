// ignore_for_file: non_constant_identifier_names

import 'package:books_demo/mvvm/views/widgets/book_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/common_methods.dart';
import '../../../common/constants/enums.dart';
import '../../../common/constants/strings/title_strings.dart';
import '../view_models/book_view_model.dart';
import 'widgets/book_list_item.dart';

class BooksFavoriteView extends StatefulWidget {
  const BooksFavoriteView({Key? key}) : super(key: key);

  @override
  State<BooksFavoriteView> createState() => _BooksFavoriteViewState();
}

class _BooksFavoriteViewState extends State<BooksFavoriteView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: CommonMethods.checkServiceStatusAndReturnWidget(
        status: BookStatus.loaded,
        loadedWidget: context.watch<BookViewModel>().booksFavorite.isEmpty
            ? _noBooksFavoriteTextFieldWithCenter
            : Consumer<BookViewModel>(
                builder: (context, viewModel, child) {
                  return ReorderableListView.builder(
                    header: _header,
                    padding: _padding(context),
                    itemCount: viewModel.booksFavorite.length,
                    onReorder: (oldIndex, newIndex) =>
                        viewModel.reorderBooksFavorite(oldIndex, newIndex),
                    itemBuilder: (context, index) {
                      return BookListItem(
                        key: ValueKey(viewModel.books![index]),
                        book: viewModel.booksFavorite[index],
                        isArrow: false,
                      );
                    },
                  );
                },
              ),
      ),
    );
  }

  Column get _header {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(EXPLAIN_REORDERABLE_LIST_FEATURE, textScaleFactor: 1.2),
        ),
        const Divider(color: Colors.transparent),
      ],
    );
  }

  Center get _noBooksFavoriteTextFieldWithCenter {
    return Center(
        child: Text(
      NO_BOOKS_FAVORITE,
      textScaleFactor: 1.5,
    ));
  }

  AppBar get _appBar =>
      AppBar(title: BookTextWidget(TitleStrings.FAVORITE_BOOKS));

  EdgeInsets _padding(BuildContext context) {
    return EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 70,
        vertical: MediaQuery.of(context).size.width / 40);
  }

  String get EXPLAIN_REORDERABLE_LIST_FEATURE =>
      "The list is reorderable. If you hold the press, you'll see";
  String get NO_BOOKS_FAVORITE => 'No books favorite';
}
