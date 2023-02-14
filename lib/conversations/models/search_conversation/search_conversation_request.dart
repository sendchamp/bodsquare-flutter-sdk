import 'dart:convert';

import 'package:equatable/equatable.dart';

class SearchConversationRequest extends Equatable {
  final String? token;
  final String? search;
  SearchConversationRequest({
    this.token,
    this.search,
  });

  SearchConversationRequest copyWith({
    String? token,
    String? search,
  }) {
    return SearchConversationRequest(
      token: token ?? this.token,
      search: search ?? this.search,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'search': search,
    };
  }

  factory SearchConversationRequest.fromMap(Map<String, dynamic> map) {
    return SearchConversationRequest(
      token: map['token'],
      search: map['search'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchConversationRequest.fromJson(String source) =>
      SearchConversationRequest.fromMap(json.decode(source));

  @override
  String toString() =>
      'SearchConversationRequest(token: $token, search: $search)';

  @override
  List<Object?> get props => [token, search];
}
