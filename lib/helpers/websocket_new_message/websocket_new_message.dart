import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'websocket_new_message.g.dart';

@JsonSerializable()
class WebsocketNewMessage extends Equatable {
  @JsonKey(name: 'company_uid')
  final String? companyUid;
  @JsonKey(name: 'contact_uid')
  final String? contactUid;
  final Data? data;
  @JsonKey(name: 'socket_name')
  final String? socketName;

  const WebsocketNewMessage({
    this.companyUid,
    this.contactUid,
    this.data,
    this.socketName,
  });

  factory WebsocketNewMessage.fromJson(Map<String, dynamic> json) {
    return _$WebsocketNewMessageFromJson(json);
  }

  Map<String, dynamic> toJson() => _$WebsocketNewMessageToJson(this);

  WebsocketNewMessage copyWith({
    String? companyUid,
    String? contactUid,
    Data? data,
    String? socketName,
  }) {
    return WebsocketNewMessage(
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
