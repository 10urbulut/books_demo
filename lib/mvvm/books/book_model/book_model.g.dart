// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      author: json['author'] as String?,
      genre: json['genre'] as String?,
      description: json['description'] as String?,
      isbn: json['isbn'] as String?,
      image: json['image'] as String?,
      published: json['published'] == null
          ? null
          : DateTime.parse(json['published'] as String),
      publisher: json['publisher'] as String?,
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'author': instance.author,
      'genre': instance.genre,
      'description': instance.description,
      'isbn': instance.isbn,
      'image': instance.image,
      'published': instance.published?.toIso8601String(),
      'publisher': instance.publisher,
    };
