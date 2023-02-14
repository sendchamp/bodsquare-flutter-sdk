// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'close_conversation_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloseConversationRequest _$CloseConversationRequestFromJson(
        Map<String, dynamic> json) =>
    CloseConversationRequest(
      conversationUid: json['conversation_uid'] as String?,
    );

Map<String, dynamic> _$CloseConversationRequestToJson(
        CloseConversationRequest instance) =>
    <String, dynamic>{
      'conversation_uid': instance.conversationUid,
    };
