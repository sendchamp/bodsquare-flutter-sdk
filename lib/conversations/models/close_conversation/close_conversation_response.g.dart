// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'close_conversation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloseConversationResponse _$CloseConversationResponseFromJson(
        Map<String, dynamic> json) =>
    CloseConversationResponse(
      status: json['status'] as String?,
      message: json['message'] as String?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$CloseConversationResponseToJson(
        CloseConversationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'code': instance.code,
    };
