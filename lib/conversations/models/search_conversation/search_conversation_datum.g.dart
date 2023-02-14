// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_conversation_datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchConversationDatum _$SearchConversationDatumFromJson(
        Map<String, dynamic> json) =>
    SearchConversationDatum(
      id: json['id'] as int?,
      companyId: json['company_id'] as String?,
      socialAccountId: json['social_account_id'] as String?,
      contactId: json['contact_id'],
      senderId: json['sender_id'] as String?,
      senderName: json['sender_name'] as String?,
      senderPhoto: json['sender_photo'] as String?,
      receiverId: json['receiver_id'] as String?,
      receiverName: json['receiver_name'] as String?,
      receiverPhoto: json['receiver_photo'] as String?,
      lastMessage: json['last_message'] as String?,
      lastMessageType: json['last_message_type'] as String?,
      profilePhoto: json['profile_photo'] as String?,
      status: json['status'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$SearchConversationDatumToJson(
        SearchConversationDatum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company_id': instance.companyId,
      'social_account_id': instance.socialAccountId,
      'contact_id': instance.contactId,
      'sender_id': instance.senderId,
      'sender_name': instance.senderName,
      'sender_photo': instance.senderPhoto,
      'receiver_id': instance.receiverId,
      'receiver_name': instance.receiverName,
      'receiver_photo': instance.receiverPhoto,
      'last_message': instance.lastMessage,
      'last_message_type': instance.lastMessageType,
      'profile_photo': instance.profilePhoto,
      'status': instance.status,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
