// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteMessageResponse _$DeleteMessageResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteMessageResponse(
      status: json['status'] as String?,
      message: json['message'] as int?,
      code: json['code'] as int?,
      data: json['data'] as String?,
    );

Map<String, dynamic> _$DeleteMessageResponseToJson(
        DeleteMessageResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
      'data': instance.data,
    };
