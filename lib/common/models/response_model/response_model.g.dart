// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ResponseModel<T> _$ResponseModelFromJson<T>(Map<String, dynamic> json) =>
    ResponseModel<T>(
      status: json['status'] as String?,
      code: json['code'] as int?,
      total: json['total'] as int?,
      data: json['data'] as List<dynamic>?,
    );

Map<String, dynamic> _$ResponseModelToJson<T>(ResponseModel<T> instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'total': instance.total,
      'data': instance.data,
    };
