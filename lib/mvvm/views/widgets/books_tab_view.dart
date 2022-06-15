import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/book_view_model.dart';
import '../books_favorite_view.dart';
import '../books_view.dart';

class BooksTabView extends StatefulWidget {
  const BooksTabView({Key? key}) : super(key: key);

  @override
  State<BooksTabView> createState() => _BooksTabViewState();
}

class _BooksTabViewState extends State<BooksTabView> {
  @override
  void initState() {
    context.read<BookViewModel>().getBooksInitial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: _tabs(context).length,
      animationDuration: const Duration(milliseconds: 400),
      child: Scaffold(
        bottomNavigationBar: _bottomNavigationTabBar(context),
        body: const TabBarView(
          children: [
            BooksView(),
            BooksFavoriteView(),
          ],
        ),
      ),
    );
  }

  TabBar _bottomNavigationTabBar(BuildContext context) {
    return TabBar(
      tabs: _tabs(context),
    );
  }

  List<Widget> _tabs(BuildContext context) {
    return [
      const Tab(
        child: Icon(
          Icons.list_alt_rounded,
          size: 35,
        ),
      ),
      Tab(
        child: Icon(
          Icons.favorite,
          color: Theme.of(context).progressIndicatorTheme.color,
          size: 35,
        ),
      )
    ];
  }
}
