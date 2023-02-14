import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  final String? channel;
  @JsonKey(name: 'company_uid')
  final String? companyUid;
  @JsonKey(name: 'connection_uid')
  final String? connectionUid;
  @JsonKey(name: 'contact_uid')
  final String? contactUid;
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  final int? id;
  @JsonKey(name: 'last_message')
  final String? lastMessage;
  @JsonKey(name: 'message_type')
  final String? messageType;
  @JsonKey(name: 'no_of_unseen_messages')
  final String? noOfUnseenMessages;
  final String? status;
  final String? uid;
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;

  const Data({
    this.channel,
    this.companyUid,
    this.connectionUid,
    this.contactUid,
    this.createdAt,
    this.id,
    this.lastMessage,
    this.messageType,
    this.noOfUnseenMessages,
    this.status,
    this.uid,
    this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    String? channel,
    String? companyUid,
    String? connectionUid,
    String? contactUid,
    DateTime? createdAt,
    int? id,
    String? lastMessage,
    String? messageType,
    String? noOfUnseenMessages,
    String? status,
    String? uid,
    DateTime? updatedAt,
  }) {
    return Data(
      channel: channel ?? this.channel,
      companyUid: companyUid ?? this.companyUid,
      connectionUid: connectionUid ?? this.connectionUid,
      contactUid: contactUid ?? this.contactUid,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      lastMessage: lastMessage ?? this.lastMessage,
      messageType: messageType ?? this.messageType,
      noOfUnseenMessages: noOfUnseenMessages ?? this.noOfUnseenMessages,
      status: status ?? this.status,
      uid: uid ?? this.uid,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      channel,
      companyUid,
      connectionUid,
      contactUid,
      createdAt,
      id,
      lastMessage,
      messageType,
      noOfUnseenMessages,
      status,
      uid,
      updatedAt,
    ];
  }
}
