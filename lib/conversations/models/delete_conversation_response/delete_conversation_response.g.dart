// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_conversation_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteConversationResponse _$DeleteConversationResponseFromJson(
        Map<String, dynamic> json) =>
    DeleteConversationResponse(
      status: json['status'] as String?,
      code: json['code'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$DeleteConversationResponseToJson(
        DeleteConversationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'code': instance.code,
      'message': instance.message,
    };
