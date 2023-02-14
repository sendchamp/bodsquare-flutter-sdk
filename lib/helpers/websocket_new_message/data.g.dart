// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      companyUid: json['company_uid'] as String?,
      contactUid: json['contact_uid'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: json['id'] as int?,
      message: json['message'] as String?,
      messageFrom: json['message_from'] as String?,
      messageType: json['message_type'] as String?,
      platform: json['platform'] as String?,
      recipientId: json['recipient_id'] as String?,
      senderId: json['sender_id'] as String?,
      status: json['status'] as String?,
      timestamp: json['timestamp'] as String?,
      twitterMessageUid: json['twitter_message_uid'] as String?,
      uid: json['uid'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'company_uid': instance.companyUid,
      'contact_uid': instance.contactUid,
      'created_at': instance.createdAt?.toIso8601String(),
      'id': instance.id,
      'message': instance.message,
      'message_from': instance.messageFrom,
      'message_type': instance.messageType,
      'platform': instance.platform,
      'recipient_id': instance.recipientId,
      'sender_id': instance.senderId,
      'status': instance.status,
      'timestamp': instance.timestamp,
      'twitter_message_uid': instance.twitterMessageUid,
      'uid': instance.uid,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
