import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'search_conversation_datum.dart';

part 'search_conversation.g.dart';

@JsonSerializable()
class SearchConversation extends Equatable {
  final String? status;
  final String? message;
  final List<SearchConversationDatum>? data;

  const SearchConversation({this.status, this.message, this.data});

  factory SearchConversation.fromJson(Map<String, dynamic> json) {
    return _$SearchConversationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchConversationToJson(this);

  SearchConversation copyWith({
    String? status,
    String? message,
    List<SearchConversationDatum>? data,
  }) {
    return SearchConversation(
      status: status ?? this.status,
      message: message ?? this.message,
      data: data ?? this.data,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, message, data];
}
