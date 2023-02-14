// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_all_conversations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllConversations _$GetAllConversationsFromJson(Map<String, dynamic> json) =>
    GetAllConversations(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              GetAllConversationsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllConversationsToJson(
        GetAllConversations instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

GetAllConversationsData _$GetAllConversationsDataFromJson(
        Map<String, dynamic> json) =>
    GetAllConversationsData(
      id: json['id'] as int?,
      uid: json['uid'] as String?,
      companyUid: json['company_uid'] as String?,
      contactUid: json['contact_uid'] as String?,
      channel: json['channel'] as String?,
      lastMessage: json['last_message'] as String?,
      messageType: json['message_type'] as String?,
      noOfUnseenMessages: json['no_of_unseen_messages'] as String?,
      connectionUid: json['connection_uid'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      contact: json['contact'] == null
          ? null
          : Contact.fromJson(json['contact'] as Map<String, dynamic>),
      status: json['status'] as String?,
      facebookConnection: json['facebook_connection'] == null
          ? null
          : Facebook.fromJson(
              json['facebook_connection'] as Map<String, dynamic>),
      twitterConnection: json['twitter_connection'] == null
          ? null
          : Twitter.fromJson(
              json['twitter_connection'] as Map<String, dynamic>),
      instagramConnection: json['instagram_connection'] == null
          ? null
          : Instagram.fromJson(
              json['instagram_connection'] as Map<String, dynamic>),
      sentMessage: json['sent_message'] as String?,
    );

Map<String, dynamic> _$GetAllConversationsDataToJson(
        GetAllConversationsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'company_uid': instance.companyUid,
      'contact_uid': instance.contactUid,
      'channel': instance.channel,
      'last_message': instance.lastMessage,
      'message_type': instance.messageType,
      'no_of_unseen_messages': instance.noOfUnseenMessages,
      'connection_uid': instance.connectionUid,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'contact': instance.contact,
      'status': instance.status,
      'facebook_connection': instance.facebookConnection,
      'twitter_connection': instance.twitterConnection,
      'instagram_connection': instance.instagramConnection,
      'sent_message': instance.sentMessage,
    };
