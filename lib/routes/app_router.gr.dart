// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../mvvm/books/book_model/book_model.dart' as _i6;
import '../mvvm/books/views/book_detail_view.dart' as _i3;
import '../mvvm/books/views/books_view.dart' as _i2;
import '../mvvm/books/widgets/books_tab_view.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    BooksTabRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.BooksTabView());
    },
    BooksRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.BooksView());
    },
    BookDetailRoute.name: (routeData) {
      final args = routeData.argsAs<BookDetailRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.BookDetailView(key: args.key, book: args.book));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(BooksTabRoute.name, path: '/'),
        _i4.RouteConfig(BooksRoute.name, path: '/books-view'),
        _i4.RouteConfig(BookDetailRoute.name, path: '/book-detail-view')
      ];
}

/// generated route for
/// [_i1.BooksTabView]
class BooksTabRoute extends _i4.PageRouteInfo<void> {
  const BooksTabRoute() : super(BooksTabRoute.name, path: '/');

  static const String name = 'BooksTabRoute';
}

/// generated route for
/// [_i2.BooksView]
class BooksRoute extends _i4.PageRouteInfo<void> {
  const BooksRoute() : super(BooksRoute.name, path: '/books-view');

  static const String name = 'BooksRoute';
}

/// generated route for
/// [_i3.BookDetailView]
class BookDetailRoute extends _i4.PageRouteInfo<BookDetailRouteArgs> {
  BookDetailRoute({_i5.Key? key, required _i6.BookModel book})
      : super(BookDetailRoute.name,
            path: '/book-detail-view',
            args: BookDetailRouteArgs(key: key, book: book));

  static const String name = 'BookDetailRoute';
}

class BookDetailRouteArgs {
  const BookDetailRouteArgs({this.key, required this.book});

  final _i5.Key? key;

  final _i6.BookModel book;

  @override
  String toString() {
    return 'BookDetailRouteArgs{key: $key, book: $book}';
  }
}
