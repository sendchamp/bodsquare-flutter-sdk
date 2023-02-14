import 'dart:convert';

import 'package:equatable/equatable.dart';

class ReportConversationRequest extends Equatable {
  final String? token;
  final String? reason;
  ReportConversationRequest({
    this.token,
    this.reason,
  });

  ReportConversationRequest copyWith({
    String? token,
    String? reason,
  }) {
    return ReportConversationRequest(
      token: token ?? this.token,
      reason: reason ?? this.reason,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'reason': reason,
    };
  }

  factory ReportConversationRequest.fromMap(Map<String, dynamic> map) {
    return ReportConversationRequest(
      token: map['token'],
      reason: map['reason'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ReportConversationRequest.fromJson(String source) =>
      ReportConversationRequest.fromMap(json.decode(source));

  @override
  String toString() =>
      'ReportConversationRequest(token: $token, reason: $reason)';

  @override
  List<Object?> get props => [token, reason];
}
