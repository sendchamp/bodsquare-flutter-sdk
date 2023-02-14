// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_social_media_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteSocialMediaResponse _$DeleteSocialMediaResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteSocialMediaResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$DeleteSocialMediaResponseToJson(
        DeleteSocialMediaResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
    };
