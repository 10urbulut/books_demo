import 'package:json_annotation/json_annotation.dart';

import '../../../common/models/response_model/response_model.dart';
import '../../../core/i_base_model.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel extends IBaseModel<BookModel> {
  BookModel({
    this.id,
    this.title,
    this.author,
    this.genre,
    this.description,
    this.isbn,
    this.image,
    this.published,
    this.publisher,
    this.isFavorite,
  });

  int? id;
  String? title;
  String? author;
  String? genre;
  String? description;
  String? isbn;
  String? image;
  DateTime? published;
  String? publisher;
  @JsonKey(ignore: true)
  bool? isFavorite;

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$BookModelToJson(this);

  @override
  BookModel fromJson(Map<String, dynamic> json) => BookModel.fromJson(json);
}

class ResponseBookModel extends ResponseModel<ResponseBookModel> {
  List<BookModel>? books;
  ResponseBookModel({this.books});
}
