// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConversationMessage _$ConversationMessageFromJson(Map<String, dynamic> json) =>
    ConversationMessage(
      id: json['id'] as int?,
      uid: json['uid'] as String?,
      companyUid: json['company_uid'] as String?,
      contactUid: json['contact_uid'] as String?,
      instagramMessageId: json['instagram_message_id'],
      senderId: json['sender_id'] as String?,
      recipientId: json['recipient_id'] as String?,
      messageFrom: json['message_from'] as String?,
      messageType: json['message_type'] as String?,
      message: json['message'] as String?,
      storyId: json['story_id'] as String?,
      isStory: json['is_story'] as bool?,
      storyUrl: json['story_url'] as String?,
      status: json['status'] as String?,
      platform: json['platform'] as String?,
      timestamp: json['timestamp'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      contact: json['contact'] == null
          ? null
          : Contact.fromJson(json['contact'] as Map<String, dynamic>),
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
    );

Map<String, dynamic> _$ConversationMessageToJson(
        ConversationMessage instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uid': instance.uid,
      'company_uid': instance.companyUid,
      'contact_uid': instance.contactUid,
      'instagram_message_id': instance.instagramMessageId,
      'sender_id': instance.senderId,
      'recipient_id': instance.recipientId,
      'message_from': instance.messageFrom,
      'message_type': instance.messageType,
      'message': instance.message,
      'story_id': instance.storyId,
      'is_story': instance.isStory,
      'story_url': instance.storyUrl,
      'status': instance.status,
      'platform': instance.platform,
      'timestamp': instance.timestamp,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'contact': instance.contact,
      'facebook_connection': instance.facebookConnection,
      'twitter_connection': instance.twitterConnection,
      'instagram_connection': instance.instagramConnection,
    };
