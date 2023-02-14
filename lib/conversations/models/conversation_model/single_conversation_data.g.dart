// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'single_conversation_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingleConversationData _$SingleConversationDataFromJson(
        Map<String, dynamic> json) =>
    SingleConversationData(
      conversation: json['conversation'] == null
          ? null
          : GetAllConversationsData.fromJson(
              json['conversation'] as Map<String, dynamic>),
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => ConversationMessage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SingleConversationDataToJson(
        SingleConversationData instance) =>
    <String, dynamic>{
      'conversation': instance.conversation,
      'messages': instance.messages,
    };
