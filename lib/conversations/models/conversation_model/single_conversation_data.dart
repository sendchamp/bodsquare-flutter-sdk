import 'package:bodsquare_sdk/conversations/models/conversation_model/conversation_message.dart';
import 'package:bodsquare_sdk/conversations/models/get_all_conversations/get_all_conversations.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'single_conversation_data.g.dart';

@JsonSerializable()
class SingleConversationData extends Equatable {
  final GetAllConversationsData? conversation;
  final List<ConversationMessage>? messages;

  const SingleConversationData({this.conversation, this.messages});

  factory SingleConversationData.fromJson(Map<String, dynamic> json) =>
      _$SingleConversationDataFromJson(json);

  Map<String, dynamic> toJson() => _$SingleConversationDataToJson(this);

  SingleConversationData copyWith({
    GetAllConversationsData? conversation,
    List<ConversationMessage>? messages,
  }) {
    return SingleConversationData(
      conversation: conversation ?? this.conversation,
      messages: messages ?? this.messages,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [conversation, messages];
}
