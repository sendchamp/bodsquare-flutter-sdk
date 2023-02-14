// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_social_media_connection_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSocialMediaConnectionResponse _$GetSocialMediaConnectionResponseFromJson(
        Map<String, dynamic> json) =>
    GetSocialMediaConnectionResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$GetSocialMediaConnectionResponseToJson(
        GetSocialMediaConnectionResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
