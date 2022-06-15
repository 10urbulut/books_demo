import 'package:json_annotation/json_annotation.dart';

import '../../../core/i_base_model.dart';

part 'response_model.g.dart';

@JsonSerializable()
class ResponseModel<T> extends IBaseModel {
  ResponseModel({
    this.status,
    this.code,
    this.total,
    this.data,
  });

  String? status;
  int? code;
  int? total;
  List<dynamic>? data;

  factory ResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ResponseModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ResponseModelToJson(this);

  @override
  fromJson(Map<String, dynamic> json) {
    ResponseModel.fromJson(json);
  }
}
