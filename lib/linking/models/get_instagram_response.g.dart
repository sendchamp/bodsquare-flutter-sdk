// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_instagram_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetInstagramResponse _$GetInstagramResponseFromJson(
        Map<String, dynamic> json) =>
    GetInstagramResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Instagram.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetInstagramResponseToJson(
        GetInstagramResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
