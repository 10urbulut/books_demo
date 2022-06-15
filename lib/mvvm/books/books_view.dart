import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/common_methods.dart';
import '../../common/constants/title_strings.dart';
import '../../common/widgets/loading_widget.dart';
import 'book_view_model.dart';
import 'widgets/book_list_item.dart';
import 'widgets/book_text_widget.dart';

class BooksView extends StatefulWidget {
  const BooksView({Key? key}) : super(key: key);

  @override
  State<BooksView> createState() => _BooksViewState();
}

class _BooksViewState extends State<BooksView> {
  @override
  void initState() {
    context.read<BookViewModel>().getBooksInitial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: BookTextWidget(TitleStrings.BOOKS)),
      body: CommonMethods.checkServiceStatusAndReturnWidget(
        status: context.watch<BookViewModel>().bookStatus,
        loadedWidget: context.watch<BookViewModel>().books == null
            ? const LoadingWidget()
            : ListView(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 70,
                    vertical: MediaQuery.of(context).size.width / 40),
                addAutomaticKeepAlives: true,
                children: context
                    .watch<BookViewModel>()
                    .books!
                    .map((e) => BookListItem(book: e))
                    .toList(),
              ),
      ),
    );
  }
}
