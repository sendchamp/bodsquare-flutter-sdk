import 'package:bodsquare_sdk/conversations/models/get_all_conversations/contact.dart';
import 'package:bodsquare_sdk/linking/models/get_social_account/get_social_account.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversation_message.g.dart';

@JsonSerializable()
class ConversationMessage extends Equatable {
  final int? id;
  final String? uid;
  @JsonKey(name: 'company_uid')
  final String? companyUid;
  @JsonKey(name: 'contact_uid')
  final String? contactUid;
  @JsonKey(name: 'instagram_message_id')
  final dynamic instagramMessageId;
  @JsonKey(name: 'sender_id')
  final String? senderId;
  @JsonKey(name: 'recipient_id')
  final String? recipientId;
  @JsonKey(name: 'message_from')
  final String? messageFrom;
  @JsonKey(name: 'message_type')
  final String? messageType;
  final String? message;
  @JsonKey(name: 'story_id')
  final String? storyId;
  @JsonKey(name: 'is_story')
  final bool? isStory;
  @JsonKey(name: 'story_url')
  final String? storyUrl;
  final String? status;
  final String? platform;
  final String? timestamp;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final Contact? contact;
  @JsonKey(name: 'facebook_connection')
  final Facebook? facebookConnection;
  @JsonKey(name: 'twitter_connection')
  final Twitter? twitterConnection;
  @JsonKey(name: 'instagram_connection')
  final Instagram? instagramConnection;

  const ConversationMessage({
    this.id,
    this.uid,
    this.companyUid,
    this.contactUid,
    this.instagramMessageId,
    this.senderId,
    this.recipientId,
    this.messageFrom,
    this.messageType,
    this.message,
    this.storyId,
    this.isStory,
    this.storyUrl,
    this.status,
    this.platform,
    this.timestamp,
    this.createdAt,
    this.updatedAt,
    this.contact,
    this.facebookConnection,
    this.twitterConnection,
    this.instagramConnection,
  });

  factory ConversationMessage.fromJson(Map<String, dynamic> json) {
    return _$ConversationMessageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ConversationMessageToJson(this);

  ConversationMessage copyWith({
    int? id,
    String? uid,
    String? companyUid,
    String? contactUid,
    dynamic instagramMessageId,
    String? senderId,
    String? recipientId,
    String? messageFrom,
    String? messageType,
    String? message,
    String? storyId,
    bool? isStory,
    String? storyUrl,
    String? status,
    String? platform,
    String? timestamp,
    DateTime? createdAt,
    DateTime? updatedAt,
    Contact? contact,
    Facebook? facebookConnection,
    Twitter? twitterConnection,
    Instagram? instagramConnection,
  }) {
    return ConversationMessage(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      companyUid: companyUid ?? this.companyUid,
      contactUid: contactUid ?? this.contactUid,
      instagramMessageId: instagramMessageId ?? this.instagramMessageId,
      senderId: senderId ?? this.senderId,
      recipientId: recipientId ?? this.recipientId,
      messageFrom: messageFrom ?? this.messageFrom,
      messageType: messageType ?? this.messageType,
      message: message ?? this.message,
      storyId: storyId ?? this.storyId,
      isStory: isStory ?? this.isStory,
      storyUrl: storyUrl ?? this.storyUrl,
      status: status ?? this.status,
      platform: platform ?? this.platform,
      timestamp: timestamp ?? this.timestamp,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      contact: contact ?? this.contact,
      facebookConnection: facebookConnection ?? this.facebookConnection,
      twitterConnection: twitterConnection ?? this.twitterConnection,
      instagramConnection: instagramConnection ?? this.instagramConnection,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      uid,
      companyUid,
      contactUid,
      instagramMessageId,
      senderId,
      recipientId,
      messageFrom,
      messageType,
      message,
      storyId,
      isStory,
      storyUrl,
      status,
      platform,
      timestamp,
      createdAt,
      updatedAt,
      contact,
      facebookConnection,
      twitterConnection,
      instagramConnection,
    ];
  }
}
