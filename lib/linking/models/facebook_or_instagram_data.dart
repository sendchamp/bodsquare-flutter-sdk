// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:equatable/equatable.dart';

class FaceBookOrInstagramData extends Equatable {
  final String? page_id;
  final String? access_token;
  final String? platform;
  final String? page_name;
  const FaceBookOrInstagramData({
    this.page_id,
    this.access_token,
    this.platform,
    this.page_name,
  });

  FaceBookOrInstagramData copyWith({
    String? page_id,
    String? access_token,
    String? platform,
    String? page_name,
  }) {
    return FaceBookOrInstagramData(
      page_id: page_id ?? this.page_id,
      access_token: access_token ?? this.access_token,
      platform: platform ?? this.platform,
      page_name: page_name ?? this.page_name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'page_id': page_id,
      'access_token': access_token,
      'platform': platform,
      'page_name': page_name,
    };
  }

  factory FaceBookOrInstagramData.fromMap(Map<String, dynamic> map) {
    return FaceBookOrInstagramData(
      page_id: map['page_id'],
      access_token: map['access_token'],
      platform: map['platform'],
      page_name: map['page_name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FaceBookOrInstagramData.fromJson(String source) =>
      FaceBookOrInstagramData.fromMap(json.decode(source));

  @override
  String toString() =>
      'FaceBookOrInstagramData(page_id: $page_id, access_token: $access_token, platform: $platform, page_name: $page_name)';

  @override
  List<Object?> get props => [page_id, access_token, platform, page_name];
}
