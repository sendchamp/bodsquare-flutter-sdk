import 'package:bodsquare_sdk/conversations/models/get_all_conversations/contact.dart';
import 'package:bodsquare_sdk/linking/models/add_social_media_response.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_all_conversations.g.dart';

@JsonSerializable()
class GetAllConversations extends Equatable {
  final String? status;
  final String? message;
  final List<GetAllConversationsData>? data;

  const GetAllConversations({this.status, this.message, this.data});

  factory GetAllConversations.fromJson(Map<String, dynamic> json) {
    return _$GetAllConversationsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GetAllConversationsToJson(this);

  GetAllConversations copyWith({
    String? status,
    String? message,
    List<GetAllConversationsData>? data,
  }) {
    return GetAllConversations(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, message, data];
}

@JsonSerializable()
class GetAllConversationsData extends Equatable {
  final int? id;
  final String? uid;
  @JsonKey(name: 'company_uid')
  final String? companyUid;
  @JsonKey(name: 'contact_uid')
  final String? contactUid;
  final String? channel;
  @JsonKey(name: 'last_message')
  final String? lastMessage;
  @JsonKey(name: 'message_type')
  final String? messageType;
  @JsonKey(name: 'no_of_unseen_messages')
  final String? noOfUnseenMessages;
  @JsonKey(name: 'connection_uid')
  final String? connectionUid;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final Contact? contact;
  final String? status;
  @JsonKey(name: 'facebook_connection')
  final Facebook? facebookConnection;
  @JsonKey(name: 'twitter_connection')
  final Twitter? twitterConnection;
  @JsonKey(name: 'instagram_connection')
  final Instagram? instagramConnection;
  @JsonKey(name: 'sent_message')
  final String? sentMessage;

  const GetAllConversationsData({
    this.id,
    this.uid,
    this.companyUid,
    this.contactUid,
    this.channel,
    this.lastMessage,
    this.messageType,
    this.noOfUnseenMessages,
    this.connectionUid,
    this.createdAt,
    this.updatedAt,
    this.contact,
    this.status,
    this.facebookConnection,
    this.twitterConnection,
    this.instagramConnection,
    this.sentMessage,
  });

  factory GetAllConversationsData.fromJson(Map<String, dynamic> json) =>
      _$GetAllConversationsDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetAllConversationsDataToJson(this);

  GetAllConversationsData copyWith({
    int? id,
    String? uid,
    String? companyUid,
    String? contactUid,
    String? channel,
    String? lastMessage,
    String? messageType,
    String? noOfUnseenMessages,
    String? connectionUid,
    DateTime? createdAt,
    DateTime? updatedAt,
    Contact? contact,
    String? status,
    Facebook? facebookConnection,
    Twitter? twitterConnection,
    Instagram? instagramConnection,
    String? sentMessage,
  }) {
    return GetAllConversationsData(
      id: id ?? this.id,
      uid: uid ?? this.uid,
      companyUid: companyUid ?? this.companyUid,
      contactUid: contactUid ?? this.contactUid,
      channel: channel ?? this.channel,
      lastMessage: lastMessage ?? this.lastMessage,
      messageType: messageType ?? this.messageType,
      noOfUnseenMessages: noOfUnseenMessages ?? this.noOfUnseenMessages,
      connectionUid: connectionUid ?? this.connectionUid,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      contact: contact ?? this.contact,
      status: status ?? this.status,
      facebookConnection: facebookConnection ?? this.facebookConnection,
      twitterConnection: twitterConnection ?? this.twitterConnection,
      instagramConnection: instagramConnection ?? this.instagramConnection,
      sentMessage: sentMessage ?? this.sentMessage,
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
      channel,
      lastMessage,
      messageType,
      noOfUnseenMessages,
      connectionUid,
      createdAt,
      updatedAt,
      contact,
      status,
      facebookConnection,
      twitterConnection,
      instagramConnection,
      sentMessage,
    ];
  }
}
