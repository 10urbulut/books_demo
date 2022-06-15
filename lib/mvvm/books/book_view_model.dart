import 'package:books_demo/services/book_service.dart';
import 'package:flutter/material.dart';

import '../../common/constants/enums.dart';
import 'book_model/book_model.dart';

class BookViewModel with ChangeNotifier {
  final BookService _service = BookService();
  BookModel? _book;
  List<BookModel>? _books;
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

  List<BookModel>? get books => _books;
  set setBooks(List<BookModel> value) {
    _books = value;
    notifyListeners();
  }

  BookModel? get book => _book;
  BookStatus get bookStatus => _bookStatus ?? BookStatus.loaded;

  set setBookStatus(BookStatus? bookStatus) {
    _bookStatus = bookStatus;
    notifyListeners();
  }
}
