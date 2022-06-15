import 'package:books_demo/mvvm/views/widgets/book_list_item.dart';
import 'package:books_demo/mvvm/views/widgets/book_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../common/common_methods.dart';
import '../../common/constants/strings/title_strings.dart';
import '../../common/constants/strings/tool_tip_strings.dart';
import '../../common/widgets/loading_widget.dart';
import '../view_models/book_view_model.dart';
import '../view_models/theme_view_model.dart';

class BooksView extends StatefulWidget {
  const BooksView({Key? key}) : super(key: key);

  @override
  State<BooksView> createState() => _BooksViewState();
}

class _BooksViewState extends State<BooksView> {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width);
    return Scaffold(
      appBar: _appBar,
      body: CommonMethods.checkServiceStatusAndReturnWidget(
        status: context.watch<BookViewModel>().bookStatus,
        loadedWidget: context.watch<BookViewModel>().books == null
            ? const LoadingWidget()
            : MediaQuery.of(context).size.width > 800
                ? _forBigView(context)
                : _forMobileView(context),
      ),
    );
  }

  ListView _forMobileView(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 70,
          vertical: MediaQuery.of(context).size.width / 40),
      addAutomaticKeepAlives: true,
      children: context
          .watch<BookViewModel>()
          .books!
          .map((e) => BookListItem(
                book: e,
                isArrow: true,
              ))
          .toList(),
    );
  }

  GridView _forBigView(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: MediaQuery.of(context).size.width > 1300 ? 3 : 2,
        crossAxisSpacing: MediaQuery.of(context).size.width / 50,
        mainAxisExtent: 170 * MediaQuery.of(context).devicePixelRatio,
      ),
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 70,
          vertical: MediaQuery.of(context).size.width / 40),
      addAutomaticKeepAlives: true,
      children: context
          .watch<BookViewModel>()
          .books!
          .map((e) => BookListItem(
                book: e,
                isArrow: true,
              ))
          .toList(),
    );
  }

  AppBar get _appBar => AppBar(
        title: BookTextWidget(TitleStrings.BOOKS),
        actions: [
          Tooltip(
            message: TooltipStrings.CHANGE_THE_THEME,
            child: Switch(
              value: context.watch<ThemeViewModel>().selectedTheme,
              onChanged: (value) {
                context.read<ThemeViewModel>().setSelectedTheme = value;
              },
            ),
          )
        ],
      );
}
