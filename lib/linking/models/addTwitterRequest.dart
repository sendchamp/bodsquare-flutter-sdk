// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

class AddTwitterRequest extends Equatable {
  final String platform;
  final String token;

  final String oauth_verifier;
  final String oauth_token;
  const AddTwitterRequest({
    required this.platform,
    required this.token,
    required this.oauth_verifier,
    required this.oauth_token,
  });

  AddTwitterRequest copyWith({
    String? platform,
    String? token,
    String? oauth_verifier,
    String? oauth_token,
  }) {
    return AddTwitterRequest(
      platform: platform ?? this.platform,
      token: token ?? this.token,
      oauth_verifier: oauth_verifier ?? this.oauth_verifier,
      oauth_token: oauth_token ?? this.oauth_token,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'platform': platform,
      'token': token,
      'oauth_verifier': oauth_verifier,
      'oauth_token': oauth_token,
    };
  }

  factory AddTwitterRequest.fromMap(Map<String, dynamic> map) {
    return AddTwitterRequest(
      platform: map['platform'] ?? '',
      token: map['token'] ?? '',
      oauth_verifier: map['oauth_verifier'] ?? '',
      oauth_token: map['oauth_token'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AddTwitterRequest.fromJson(String source) =>
      AddTwitterRequest.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AddTwitterRequest(platform: $platform, token: $token, oauth_verifier: $oauth_verifier, oauth_token: $oauth_token)';
  }

  @override
  List<Object> get props => [platform, token, oauth_verifier, oauth_token];
}
