import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'close_conversation_response.g.dart';

@JsonSerializable()
class CloseConversationResponse extends Equatable {
  final String? status;
  final String? message;
  final int? code;

  const CloseConversationResponse({this.status, this.message, this.code});

  factory CloseConversationResponse.fromJson(Map<String, dynamic> json) {
    return _$CloseConversationResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CloseConversationResponseToJson(this);

  CloseConversationResponse copyWith({
    String? status,
    String? message,
    int? code,
  }) {
    return CloseConversationResponse(
      status: status ?? this.status,
      message: message ?? this.message,
      code: code ?? this.code,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, message, code];
}
