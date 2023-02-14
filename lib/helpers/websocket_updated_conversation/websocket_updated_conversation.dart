import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'websocket_updated_conversation.g.dart';

@JsonSerializable()
class WebsocketUpdatedConversation extends Equatable {
  @JsonKey(name: 'company_uid')
  final String? companyUid;
  @JsonKey(name: 'contact_uid')
  final String? contactUid;
  final Data? data;
  @JsonKey(name: 'socket_name')
  final String? socketName;

  const WebsocketUpdatedConversation({
    this.companyUid,
    this.contactUid,
    this.data,
    this.socketName,
  });

  factory WebsocketUpdatedConversation.fromJson(Map<String, dynamic> json) {
    return _$WebsocketUpdatedConversationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WebsocketUpdatedConversationToJson(this);

  WebsocketUpdatedConversation copyWith({
    String? companyUid,
    String? contactUid,
    Data? data,
    String? socketName,
  }) {
    return WebsocketUpdatedConversation(
      companyUid: companyUid ?? this.companyUid,
      contactUid: contactUid ?? this.contactUid,
      data: data ?? this.data,
      socketName: socketName ?? this.socketName,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [companyUid, contactUid, data, socketName];
}
