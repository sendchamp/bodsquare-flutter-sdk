import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'close_conversation_request.g.dart';

@JsonSerializable()
class CloseConversationRequest extends Equatable {
  @JsonKey(name: 'conversation_uid')
  final String? conversationUid;

  const CloseConversationRequest({this.conversationUid});

  factory CloseConversationRequest.fromJson(Map<String, dynamic> json) {
    return _$CloseConversationRequestFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CloseConversationRequestToJson(this);

  CloseConversationRequest copyWith({
    String? conversationUid,
  }) {
    return CloseConversationRequest(
      conversationUid: conversationUid ?? this.conversationUid,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [conversationUid];
}
