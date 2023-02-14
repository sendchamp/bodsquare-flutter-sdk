// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_conversation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchConversation _$SearchConversationFromJson(Map<String, dynamic> json) =>
    SearchConversation(
      status: json['status'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              SearchConversationDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchConversationToJson(SearchConversation instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
