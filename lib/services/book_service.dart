// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:io';

import 'package:books_demo/common/models/response_model/response_model.dart';
import 'package:books_demo/core/toastr/toastr_strings.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../common/constants/service_needs.dart';
import '../core/toastr/toastr.dart';
import '../mvvm/models/book_model/book_model.dart';

class BookService {
  static final BookService _singleton = BookService._internal();
  factory BookService() => _singleton;
  BookService._internal();

  Future<List<BookModel>> getBooks() async {
    final String url = ServiceNeeds.baseUri + ServicePaths.books.path;

    http.Response response = await http.get(Uri.parse(url));

    debugPrint(response.statusCode.toString());

    if (response.statusCode == HttpStatus.ok) {
      List<BookModel> books = await compute(_jsonParser, response);

      return books;
    } else {
      Toastr.buildErrorToast(ToastrStrings.FAILED_TO_LOAD_BOOKS);

      throw Exception(ToastrStrings.FAILED_TO_LOAD_BOOKS);
    }
  }

  Future<List<BookModel>> _jsonParser(http.Response response) async {
    ResponseModel responseModel =
        ResponseModel.fromJson(jsonDecode(response.body));

    List<BookModel> books = responseModel.data!
        .map((e) => BookModel.fromJson(e))
        .toList()
        .cast<BookModel>();

    return books;
  }
}
