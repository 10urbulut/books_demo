// ignore_for_file: prefer_interpolation_to_compose_strings

import 'dart:convert';
import 'dart:io';

import 'package:books_demo/common/models/response_model/response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../common/constants/service_needs.dart';
import '../mvvm/models/book_model/book_model.dart';

class BookService {
  static final BookService _singleton = BookService._internal();
  factory BookService() => _singleton;
  BookService._internal();

  Future<List<BookModel>> getBooks() async {
    http.Response response = await http
        .get(Uri.parse(ServiceNeeds.baseUri + ServicePaths.books.path));

    debugPrint(response.statusCode.toString());

    if (response.statusCode == HttpStatus.ok) {
      ResponseModel responseModel = ResponseModel();

      await compute(_jsonParser, response)
          .then((value) => responseModel = value);

      return responseModel.data!
          .map((e) => BookModel.fromJson(e))
          .toList()
          .cast<BookModel>();
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<ResponseModel> _jsonParser(http.Response response) async {
    await Future.delayed(const Duration(seconds: 3));
    ResponseModel responseModel =
        ResponseModel.fromJson(jsonDecode(response.body));
    return responseModel;
  }
}
