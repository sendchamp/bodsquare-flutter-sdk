// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

class SendConversationRequest extends Equatable {
  final String? token;
  final String? message;
  final String? message_type;
  const SendConversationRequest({
    this.token,
    this.message,
    this.message_type,
  });

  SendConversationRequest copyWith({
    String? token,
    String? message,
    String? message_type,
  }) {
    return SendConversationRequest(
      token: token ?? this.token,
      message: message ?? this.message,
      message_type: message_type ?? this.message_type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'message': message,
      'message_type': message_type,
    };
  }

  factory SendConversationRequest.fromMap(Map<String, dynamic> map) {
    return SendConversationRequest(
      token: map['token'],
      message: map['message'],
      message_type: map['message_type'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SendConversationRequest.fromJson(String source) =>
      SendConversationRequest.fromMap(json.decode(source));

  @override
  String toString() =>
      'SendConversationRequest(token: $token, message: $message, message_type: $message_type)';

  @override
  List<Object?> get props => [token, message, message_type];
}
