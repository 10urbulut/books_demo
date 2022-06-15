import 'package:auto_route/auto_route.dart';
import 'package:books_demo/mvvm/books/widgets/books_tab_view.dart';
import 'package:flutter/material.dart';

import '../mvvm/books/views/book_detail_view.dart';
import '../mvvm/books/views/books_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: "View,Route",
  routes: <AutoRoute>[
    AutoRoute(page: BooksTabView, initial: true),
    AutoRoute(page: BooksView),
    AutoRoute(page: BookDetailView),
  ],
)
class $AppRouter {}

class EmptyNavigationRouter extends AutoRouter {
  const EmptyNavigationRouter({Key? key}) : super(key: key);
}
