// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      channel: json['channel'] as String?,
      companyUid: json['company_uid'] as String?,
      connectionUid: json['connection_uid'] as String?,
      contactUid: json['contact_uid'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: json['id'] as int?,
      lastMessage: json['last_message'] as String?,
      messageType: json['message_type'] as String?,
      noOfUnseenMessages: json['no_of_unseen_messages'] as String?,
      status: json['status'] as String?,
      uid: json['uid'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'channel': instance.channel,
      'company_uid': instance.companyUid,
      'connection_uid': instance.connectionUid,
      'contact_uid': instance.contactUid,
      'created_at': instance.createdAt?.toIso8601String(),
      'id': instance.id,
      'last_message': instance.lastMessage,
      'message_type': instance.messageType,
      'no_of_unseen_messages': instance.noOfUnseenMessages,
      'status': instance.status,
      'uid': instance.uid,
      'updated_at': instance.updatedAt?.toIso8601String(),
    };
