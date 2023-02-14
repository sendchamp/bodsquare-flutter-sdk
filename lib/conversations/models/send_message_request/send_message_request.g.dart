// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendMessageRequest _$SendMessageRequestFromJson(Map<String, dynamic> json) =>
    SendMessageRequest(
      messageType: json['message_type'] as String?,
      message: json['message'] as String?,
      conversationId: json['conversation_uid'] as String?,
    );

Map<String, dynamic> _$SendMessageRequestToJson(SendMessageRequest instance) =>
    <String, dynamic>{
      'message_type': instance.messageType,
      'message': instance.message,
      'conversation_uid': instance.conversationId,
    };
