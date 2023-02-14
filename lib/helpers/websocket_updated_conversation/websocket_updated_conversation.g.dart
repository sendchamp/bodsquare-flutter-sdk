// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'websocket_updated_conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WebsocketUpdatedConversation _$WebsocketUpdatedConversationFromJson(
        Map<String, dynamic> json) =>
    WebsocketUpdatedConversation(
      companyUid: json['company_uid'] as String?,
      contactUid: json['contact_uid'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      socketName: json['socket_name'] as String?,
    );

Map<String, dynamic> _$WebsocketUpdatedConversationToJson(
        WebsocketUpdatedConversation instance) =>
    <String, dynamic>{
      'company_uid': instance.companyUid,
      'contact_uid': instance.contactUid,
      'data': instance.data,
      'socket_name': instance.socketName,
    };
