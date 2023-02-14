import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_conversation_datum.g.dart';

@JsonSerializable()
class SearchConversationDatum extends Equatable {
  final int? id;
  @JsonKey(name: 'company_id')
  final String? companyId;
  @JsonKey(name: 'social_account_id')
  final String? socialAccountId;
  @JsonKey(name: 'contact_id')
  final dynamic contactId;
  @JsonKey(name: 'sender_id')
  final String? senderId;
  @JsonKey(name: 'sender_name')
  final String? senderName;
  @JsonKey(name: 'sender_photo')
  final String? senderPhoto;
  @JsonKey(name: 'receiver_id')
  final String? receiverId;
  @JsonKey(name: 'receiver_name')
  final String? receiverName;
  @JsonKey(name: 'receiver_photo')
  final String? receiverPhoto;
  @JsonKey(name: 'last_message')
  final String? lastMessage;
  @JsonKey(name: 'last_message_type')
  final String? lastMessageType;
  @JsonKey(name: 'profile_photo')
  final String? profilePhoto;
  final String? status;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const SearchConversationDatum({
    this.id,
    this.companyId,
    this.socialAccountId,
    this.contactId,
    this.senderId,
    this.senderName,
    this.senderPhoto,
    this.receiverId,
    this.receiverName,
    this.receiverPhoto,
    this.lastMessage,
    this.lastMessageType,
    this.profilePhoto,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory SearchConversationDatum.fromJson(Map<String, dynamic> json) =>
      _$SearchConversationDatumFromJson(json);

  Map<String, dynamic> toJson() => _$SearchConversationDatumToJson(this);

  SearchConversationDatum copyWith({
    int? id,
    String? companyId,
    String? socialAccountId,
    dynamic contactId,
    String? senderId,
    String? senderName,
    String? senderPhoto,
    String? receiverId,
    String? receiverName,
    String? receiverPhoto,
    String? lastMessage,
    String? lastMessageType,
    String? profilePhoto,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return SearchConversationDatum(
      id: id ?? this.id,
      companyId: companyId ?? this.companyId,
      socialAccountId: socialAccountId ?? this.socialAccountId,
      contactId: contactId ?? this.contactId,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      senderPhoto: senderPhoto ?? this.senderPhoto,
      receiverId: receiverId ?? this.receiverId,
      receiverName: receiverName ?? this.receiverName,
      receiverPhoto: receiverPhoto ?? this.receiverPhoto,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageType: lastMessageType ?? this.lastMessageType,
      profilePhoto: profilePhoto ?? this.profilePhoto,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      companyId,
      socialAccountId,
      contactId,
      senderId,
      senderName,
      senderPhoto,
      receiverId,
      receiverName,
      receiverPhoto,
      lastMessage,
      lastMessageType,
      profilePhoto,
      status,
      createdAt,
      updatedAt,
    ];
  }
}
