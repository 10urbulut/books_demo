// ignore_for_file: prefer_final_fields

import 'package:books_demo/services/book_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../common/constants/enums.dart';
import '../models/book_model/book_model.dart';

class BookViewModel with ChangeNotifier {
  final BookService _service = BookService();
  BookModel? _book;
  List<BookModel>? _books;
  List<BookModel> _booksFavorite = [];
  BookStatus? _bookStatus;

  Future<List<BookModel>> getBooks() async {
    try {
      setBookStatus = BookStatus.loading;
      setBooks = await _service
          .getBooks()
          .whenComplete(() => setBookStatus = BookStatus.loaded);
      return _books ?? [];
    } catch (e) {
      setBookStatus = BookStatus.error;
      return [];
    }
  }

  Future<List<BookModel>> getBooksInitial() async {
    try {
      _bookStatus = BookStatus.loading;

      _books = await _service
          .getBooks()
          .whenComplete(() => setBookStatus = BookStatus.loaded);
      return _books ?? [];
    } catch (e) {
      setBookStatus = BookStatus.error;
      return [];
    }
  }

  void reorderBooksFavorite(int oldIndex, int newIndex) {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    BookModel item = _booksFavorite.removeAt(oldIndex);
    _booksFavorite.insert(newIndex, item);
  }

  void selectUnselectBookFavorite(BookModel book, bool selection) {
    setBookIsFavorite = book;

    _booksFavorite.contains(book)
        ? _booksFavorite.remove(book)
        : _booksFavorite.add(book);
    notifyListeners();
  }

  List<BookModel>? get books => _books;
  List<BookModel> get booksFavorite => _booksFavorite;
  set setBooks(List<BookModel> value) {
    _books = value;
    notifyListeners();
  }

  BookModel? get book => _book;
  BookStatus get bookStatus => _bookStatus ?? BookStatus.loaded;
  set setBookIsFavorite(BookModel value) {
    _book = value;
    // getBooksFavorite();
    notifyListeners();
  }

  set setBookStatus(BookStatus? bookStatus) {
    _bookStatus = bookStatus;
    notifyListeners();
  }
}
