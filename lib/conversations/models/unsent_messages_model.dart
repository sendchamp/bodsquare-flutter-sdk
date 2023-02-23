// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:bodsquare_sdk/conversations/views/file_preview_page.dart';
import 'package:equatable/equatable.dart';

class UnsentMessages extends Equatable {
  //enum
  final MessageType messageType;
  final String? message;
  final String? messageTime;

  final String? filePath;
  final String? platform;
  final String? name;
  final String? conversationUid;
  const UnsentMessages({
    required this.messageType,
    this.message,
    this.messageTime,
    this.filePath,
    this.platform,
    this.name,
    this.conversationUid,
  });

  UnsentMessages copyWith({
    MessageType? messageType,
    String? message,
    String? messageTime,
    String? filePath,
    String? platform,
    String? name,
    String? conversationUid,
  }) {
    return UnsentMessages(
      messageType: messageType ?? this.messageType,
      message: message ?? this.message,
      messageTime: messageTime ?? this.messageTime,
      filePath: filePath ?? this.filePath,
      platform: platform ?? this.platform,
      name: name ?? this.name,
      conversationUid: conversationUid ?? this.conversationUid,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'messageType': messageType.index,
      'message': message,
      'messageTime': messageTime,
      'filePath': filePath,
      'platform': platform,
      'name': name,
      'conversationUid': conversationUid,
    };
  }

  factory UnsentMessages.fromMap(Map<String, dynamic> map) {
    return UnsentMessages(
      messageType: MessageType.values[map['messageType'] as int],
      message: map['message'] != null ? map['message'] as String : null,
      messageTime:
          map['messageTime'] != null ? map['messageTime'] as String : null,
      filePath: map['filePath'] != null ? map['filePath'] as String : null,
      platform: map['platform'] != null ? map['platform'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      conversationUid: map['conversationUid'] != null
          ? map['conversationUid'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UnsentMessages.fromJson(String source) =>
      UnsentMessages.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      messageType,
      message,
      messageTime,
      filePath,
      platform,
      name,
      conversationUid,
    ];
  }
}
