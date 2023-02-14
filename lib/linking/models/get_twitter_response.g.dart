// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_twitter_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTwitterResponse _$GetTwitterResponseFromJson(Map<String, dynamic> json) =>
    GetTwitterResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Twitter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetTwitterResponseToJson(GetTwitterResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
