// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_facebook_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetFacebookResponse _$GetFacebookResponseFromJson(Map<String, dynamic> json) =>
    GetFacebookResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Facebook.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetFacebookResponseToJson(
        GetFacebookResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
