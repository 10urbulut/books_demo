import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../mvvm/views/book_detail_view.dart';
import '../mvvm/views/books_view.dart';
import '../mvvm/views/widgets/books_tab_view.dart';

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
