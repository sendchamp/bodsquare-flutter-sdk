import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'delete_conversation_response.g.dart';

@JsonSerializable()
class DeleteConversationResponse extends Equatable {
  final String? status;
  final int? code;
  final String? message;

  const DeleteConversationResponse({this.status, this.code, this.message});

  factory DeleteConversationResponse.fromJson(Map<String, dynamic> json) {
    return _$DeleteConversationResponseFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DeleteConversationResponseToJson(this);

  DeleteConversationResponse copyWith({
    String? status,
    int? code,
    String? message,
  }) {
    return DeleteConversationResponse(
      status: status ?? this.status,
      code: code ?? this.code,
      message: message ?? this.message,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, code, message];
}
