import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  @JsonKey(name: 'company_uid')
  final String? companyUid;
  @JsonKey(name: 'contact_uid')
  final String? contactUid;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  final int? id;
  final String? message;
  @JsonKey(name: 'message_from')
  final String? messageFrom;
  @JsonKey(name: 'message_type')
  final String? messageType;
  final String? platform;
  @JsonKey(name: 'recipient_id')
  final String? recipientId;
  @JsonKey(name: 'sender_id')
  final String? senderId;
  final String? status;
  final String? timestamp;
  @JsonKey(name: 'twitter_message_uid')
  final String? twitterMessageUid;
  final String? uid;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const Data({
    this.companyUid,
    this.contactUid,
    this.createdAt,
    this.id,
    this.message,
    this.messageFrom,
    this.messageType,
    this.platform,
    this.recipientId,
    this.senderId,
    this.status,
    this.timestamp,
    this.twitterMessageUid,
    this.uid,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    String? companyUid,
    String? contactUid,
    DateTime? createdAt,
    int? id,
    String? message,
    String? messageFrom,
    String? messageType,
    String? platform,
    String? recipientId,
    String? senderId,
    String? status,
    String? timestamp,
    String? twitterMessageUid,
    String? uid,
    DateTime? updatedAt,
  }) {
    return Data(
      companyUid: companyUid ?? this.companyUid,
      contactUid: contactUid ?? this.contactUid,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      message: message ?? this.message,
      messageFrom: messageFrom ?? this.messageFrom,
      messageType: messageType ?? this.messageType,
      platform: platform ?? this.platform,
      recipientId: recipientId ?? this.recipientId,
      senderId: senderId ?? this.senderId,
      status: status ?? this.status,
      timestamp: timestamp ?? this.timestamp,
      twitterMessageUid: twitterMessageUid ?? this.twitterMessageUid,
      uid: uid ?? this.uid,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      companyUid,
      contactUid,
      createdAt,
      id,
      message,
      messageFrom,
      messageType,
      platform,
      recipientId,
      senderId,
      status,
      timestamp,
      twitterMessageUid,
      uid,
      updatedAt,
    ];
  }
}
