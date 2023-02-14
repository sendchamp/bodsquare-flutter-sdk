import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_message_request.g.dart';

@JsonSerializable()
class SendMessageRequest extends Equatable {
  @JsonKey(name: 'message_type')
  final String? messageType;
  final String? message;
  @JsonKey(name: 'conversation_uid')
  final String? conversationId;

  const SendMessageRequest({
    this.messageType,
    this.message,
    this.conversationId,
  });

  factory SendMessageRequest.fromJson(Map<String, dynamic> json) {
    return _$SendMessageRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SendMessageRequestToJson(this);

  SendMessageRequest copyWith({
    String? messageType,
    String? message,
    String? conversationId,
  }) {
    return SendMessageRequest(
      messageType: messageType ?? this.messageType,
      message: message ?? this.message,
      conversationId: conversationId ?? this.conversationId,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [messageType, message, conversationId];
}
