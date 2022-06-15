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
            ? const Center(
                child: Text(
                'No books favorite',
                textScaleFactor: 2,
              ))
            : Consumer<BookViewModel>(
                builder: (context, viewModel, child) {
                  return ReorderableListView.builder(
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

  AppBar get _appBar =>
      AppBar(title: BookTextWidget(TitleStrings.FAVORITE_BOOKS));

  EdgeInsets _padding(BuildContext context) {
    return EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width / 70,
        vertical: MediaQuery.of(context).size.width / 40);
  }
}
